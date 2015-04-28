#Tags

##Why are tags different?

We're manipulating an array instead of each object in the array, and the methods and functions we are using don't know how to deal with items in an array for the most part, they deal with the whole object. Angular knows how to set `$scope.newPost.tag_ids = ['array', 'of', 'ids']`, but if we haven't already defined the array first, it can't push things into the array--so if we don't have `$scope.newPost.tag_ids = []`, it can't do `$scope.newPost.tag_ids.push(something)`.

This is true in Rails, too. Let's think about what displaying our index page would look like in Rails. In our index controller, we'd do `@posts = Post.all`. For each post in `posts`, we'd be able to do `post.tag_ids`, but if we wanted to show the name of each tag, we'd need to write a function to do that--we would either need to have `@tags = Tag.all` and then get the name from that id, or we'd need to write a new method to access this information, or we'd have to build a join table to make this data accessible to us. In all of those cases, though, we're teaching Rails how to name a `tag_id` in a post; it doesn't just know.

So how do we do this? Let's look at tags again.

##What do tags look like

We know that a 
`GET /posts` request will return something like this:

    [
      {
        "content": "Lorem Ipsum",
        "date": "2015-01-07T00:00:00.000Z",
        "id": "54ad8bba6f69fd0002000001",
        "tag_ids": ["foo", "bar"],
        "title": "Test"
      }
    ]

We also know that a `GET /tags` request will return something like this:

    [
      {
        "id": "54ad8d8d6f69fd0002000003",
        "name": "Yum"
      },
      {
        "id": "2o34is8d3io4jsfjw390q3jsoier",
        "name": "Ada"
      }
    ]


Now, let's create a method that will allow us to pass in ids and return tag names.
First, let's create a method in the controller and call it in the view.

In `layout.js`, inside your `homeController`, add the following text:

    $scope.getTagName = function(id) {
      ret = "woo who! The id is " + id;
      return ret;
    }

Now, in `home.html`, replace `{{tag_id}}` with `{{getTagName(tag_id)}}`. Then, look
at the result in the browser.

Woo hoo! We did it! We created and called an instance function. Now, let's make 
the function actually return the stuff we want.

Back in `layout.js`, inside your `$scope.getTagName` function, let's add a for loop
so we can iterate through $scope.tags. Update your code so it does the following:

    $scope.getTagName = function(id) {
      ret = [id, ];
      // loops through all of the tags in $scope.tags
      for (i = 0; i < $scope.tags.length; i++){
        ret.push($scope.tags[i]);
      }
      return ret;
    }

So now, every time we call `getTagName(id)`, we create an array that starts with
the id we passed in and then includes every tag.

What we really want, though, is to see if the tag id is the same as the id we
are passing in. Update your code again, as follows:

    $scope.getTagName = function(id) {
      ret = "";
      // loops through all of the tags in $scope.tags
      for (i = 0; i < $scope.tags.length; i++){
        // checks to see if the param we passed is equal to the tag id
        if(id == $scope.tags[i].id) {
          ret = $scope.tags[i]
        }
      }
      return ret;
    }

Almost there. We don't want to see the whole tag, though--we want to see the 
tag name. Update that code one more time, to get this:

  $scope.getTagName = function(id) {
    ret = "";
    // loops through all of the tags in $scope.tags
    for (i = 0; i < $scope.tags.length; i++){
      // checks to see if the param we passed is equal to the tag id
      if(id == $scope.tags[i].id) {
        // sets ret as the name of that tag
        ret = $scope.tags[i].name
      }
    }
    return ret;
  }

This should show all of the tags now!


##Adding tags to a new post

Think about what action happens when you click on a checkbox. A checkbox is like an array, with each value being checked mapping to something you push into an array. This means that effectively, what we're doing is a `.push` function with our checkbox, which again Angular doesn't know what we want on its own. Let's fix that.

Update your `home.html`
so the form code looks like the following:

      <div class="form">
        Title: <input type="text" ng-model="newPost.title"/>
        Content: <input type="text" ng-model="newPost.content"/>
        Tags:
          <span ng-repeat="tag in tags">
            <input type="checkbox" value="tag.id" ng-click="toggleId(tag.id)">{{tag.name}}</input>
          </span>
        {{newPost}}
      </div>

Now, in `layout.js`, create the following function:

    $scope.toggleId = function(id) {
      //gets the index of the id in the tag_ids array
      i = $scope.newPost.tag_ids.indexOf(id);

      //if the value doesn't exist, indexOf returns -1
      //This if block could be written in pseudo code as "if id not in tag_ids"
      if(i == -1) {

        //adds the id to the array
        $scope.newPost.tag_ids.push(id);

      //if it is already in the array
      } else {
        //remove it from the array
        $scope.newPost.tag_ids.splice(i, 1);
      }
    }

Now, if you click on the check boxes, it should toggle the contents of the model.


##Filtering on tags

Again, it's hard to filter based on tags. If we filter based on a tag, we're passing an array to a function that's expecting a single object. To get around this, we'll create a custom filter.


Custom filter syntax looks like this:

    moduleName.filter('filterName', function() {
      return function(variableNameForWhatWe'reFiltering, anyAdditionalParams) {
        return variableNameForWhatWe'reFiltering.filter(function(variableNameForJustOne) {
          //condition
            //return true if we want it to show up in the view
          //else
            //return false, and it won't show in the view
        });
      };
    });



in your posts controller, add this:

    $scope.tagArray = [];

    $scope.addTag = function(id) {
      var i = $scope.tagArray.indexOf(id);
      // i will equal either the index of the 
      // item if it's in the array, or -1 if not

      if(i == -1) {
        $scope.tagArray.push(id);
      } else {
        $scope.tagArray.splice(i, 1);
      }
    }

(we'll talk more about what/why)

Then, add this to your search bar:

    Tags: <span ng-repeat="tag in tags">
          <input type="checkbox" value="tag.id" ng-click="addTag(tag.id)">{{tag.name}}</input>
        </span><br>
    tag array is {{tagArray}}<br>

And add this to your ng-repeat:

    <span ng-repeat="post in posts | filter:search:strict | selectedTags:tagArray">

Then create filter (get filter from Brenda too to add here)