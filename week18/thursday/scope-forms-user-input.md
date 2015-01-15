#Scopes, forms, and user input!

##Adding some "data" to our blahg!

Next week, we'll actually hook up our blahg to the real API, with a real database
and real data manipulation. For now, however, we're going to use some fixed data,
just like the phones in the first few steps of the phonecat tutorial.

Let's put together some data for an index page. On an index page, we'll want
to make a `GET /posts` request and a `GET /tags` request. We know that a 
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

Since we know these things, we can create some fixed data with the same structure
and use it in our views. Since we're working with objects with that same structure,
we can assume that when we hook in the actual data, our views will look pretty much
the same.

I created some fixed data for you that you can go ahead and paste in. You're going to
put it in your `layout.js` file (and yes, Ellen has realized that this should have 
been `home.js` or `index.js`. Whoops). So, inside your HomeController, we'll add some code so it looks kind of like this:

    var homeControllerModule = angular.module('homeControllerModule', []);

    homeControllerModule.controller('homeController', ['$scope', '$http', function($scope, $http) {
      $scope.posts = //an array we'll add!
      $scope.tags = //an array we'll add!
    }]);

For the actual content itself, you can use this:

    $scope.posts = [
      {
        "content": "Run biting sagittis elit cras nec vestibulum, tempus lick sleep on your keyboard stuck in a tree suscipit. Vestibulum judging you sleep in the sink eat the grass non non, zzz amet pellentesque tincidunt a. Iaculis purr rutrum claw faucibus sniff, nibh quis nunc feed me suspendisse vehicula toss the mousie. Sleep in the sink justo vestibulum ac hairball, tail flick jump eat faucibus enim ut purr iaculis. Zzz give me fish stuck in a tree jump on the table, in viverra rhoncus scratched sleep in the sink hiss stuck in a tree pharetra. Rutrum bat nam orci turpis sniff suspendisse, nibh rutrum nunc sagittis run orci turpis. Bat purr fluffy fur libero, attack lick adipiscing catnip sleep in the sink nunc.",
        "date": "2015-01-07T00:00:00.000Z",
        "id": "123abc",
        "tag_ids": ["1a", "2b"],
        "title": "My day"
      },
      {
        "content": "Kitty ipsum dolor sit amet, climb the curtains run hairball judging you leap, biting sniff jump on the table fluffy fur biting. Lay down in your way run bat chase the red dot biting climb the curtains, bat chuf sleep on your face meow. I don't like that food tail flick biting leap puking, meow scratched stuck in a tree lick sleep in the sink climb the curtains. Puking jump on the table feed me rip the couch judging you, meow tail flick purr I don't like that food jump leap. Sniff bat bat feed me I don't like that food meow, toss the mousie toss the mousie toss the mousie feed me. Sleep on your keyboard bat purr hairball, sniff claw run jump on the table chuf eat. Chuf stuck in a tree biting chuf, eat the grass claw stretching sleep in the sink hairball stuck in a tree.",
        "date": "2015-01-07T00:00:00.000Z",
        "id": "woEvm3",
        "tag_ids": [],
        "title": "Turtles are weird"
      },
      {
        "content": "In viverra faucibus justo bat, faucibus faucibus dolor sniff kittens non. Run judging you climb the curtains faucibus leap, vehicula sleep on your keyboard vehicula tortor faucibus stuck in a tree. Catnip eat the grass vehicula chase the red dot knock over the lamp, stuck in a tree rhoncus stuck in a tree neque quis nunc pellentesque. Vel sagittis feed me sagittis shed everywhere neque, cras nec suscipit chase the red dot sagittis. Attack your ankles elit claw sollicitudin purr scratched, puking suspendisse puking bibendum enim enim ut. Libero scratched orci turpis cras nec jump on the table nullam, catnip fluffy fur catnip nunc. Biting etiam feed me sollicitudin, litter box stuck in a tree climb the curtains bat chuf eat. Hairball dolor meow knock over the lamp hairball, libero quis enim feed me sunbathe nibh shed everywhere.",
        "date": "2015-01-07T00:00:00.000Z",
        "id": "bo2jwi",
        "tag_ids": ["2b", "doop5"],
        "title": "Teaching at Ada"
      }
    ]

    $scope.tags =
      [ 
        { "id": "1a", "name": "2cool4school" },
        { "id": "2b", "name": "kittycat" },
        { "id": "doop5", "name": "everything is awesome" }
      ]

You are, of course, welcome to create your own data. This just seems pretty quick and easy.

What does that `$scope.posts` thing do, again? Well, it creates a model (which
in AngularJS means a variable held on the scope of the view). So now, this
model/variable exists, and the view should know what it is and how to use it!

Okay! We've created some data! Let's look at it in the view! Open `home.html` 
in your text editor. Inside your `<div ng-controller="homeController">`, add 
`{{posts}}` and `{{tags}}` so we can see what that looks like, and then look at
it in your browser.

Go ahead. I'll wait.

.

.

...

##Use `ng-repeat` to clean up the display

Okay. We know that our data is an array of separate objects, but AngularJS is
displaying it as a giant blob of data. That isn't terribly useful. Let's add
some logic to clean that up.

First, let's separate each blog post into `div`s so we can see what's happening
with each one. To do this, we'll use a directive called `ng-repeat`. Delete the
line in your `home.html` file that says `{{posts}}`, and replace it with 
`<div ng-repeat="post in posts">{{post}}<hr></div>`.

`ng-repeat` is a rails directive that repeats the element it is called on for each
element in an array. It takes two parameters and uses the keyword "in," so the syntax
looks like `ng-repeat="newVariableName in array"`. So, in this case, we're creating
a new div for every object in our `posts` array, and we're referring to each object
as `post`. Then, we print the value of that object to the screen, plus an `<hr>`
to help us see the breaks between each object.

This is functionally equivalent to the following code in Rails:

    <% posts.each do |post| %>
      <div>
        <%= post.inspect %>
        <hr>
      </div>
    <% end %>

Awesome. So we have different posts now. It's still pretty hard to read, though--
let's get rid of some of this extra information we don't really need.

My users probably don't care about the id or the tag id; they probably only want
to see the title, maybe the date, and the content. Let's go to `home.html` and
delete the line that says `{{post}}`. Let's change it to the following:

    <h2>{{post.title}}</h2>
    <small>{{post.date}}</small>
    <p>{{post.content}}</p>
    <hr>

##Write an instance function to display tag names

We're starting to look like a real index of posts! I wish we could see which tags
were associated with each post, though. Let's do that!

So first, let's isolate our tags. After the `h2` in `home.html`, add this: 
`<small ng-repeat="tag_id in post.tag_id">{{tag_id}}</small>`. Look at what that
looks like in the browser; you should have a number of tag ids printing out to the
screen as strings.

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


##Add some forms with user input

Okay, so right now we aren't actually going to have a real data source, but 
we can get the form ready to submit once we actually have our API.

First, let's just create some inputs that we can arrange into a form. In your 
`home.html`, add the following code:

    <div class="form">
      Title: <input type="text"/>
      Content: <input type="text"/>
      Tags: <span ng-repeat="tag in tags">
        <input type="checkbox" value="tag.id">{{tag.name}}</input>
      </span>
    </div>

This creates some input values in a div, and it creates a checkbox for each
tag in the tags.

In AngularJS, when we create a new model, we first want to initialize it in the
controller and then attach our `ng-model` attributes in the view. It's a lot
simpler than it sounds.

First, in `layout.js`, in your `homeController`, add the line `$scope.newPost = {'tag_ids': []}`.

Then, in `home.html`, update the code so it looks like the following:

    <div class="form">
      Title: <input type="text" ng-model="newPost.title"/>
      Content: <input type="text" ng-model="newPost.content"/>
      Tags:
        <span ng-repeat="tag in tags">
          <input type="checkbox" value="tag.id">{{tag.name}}</input>
        </span>
      {{newPost}}
    </div>

Now, if you refresh the page, you'll see that the `{{newPost}}` updates as you
add things to the title and the contents.

Next, we need to add a click event to the checkboxes to get them to move the 
appropriate values in and out of the `newPost.tag_ids`. Update your `home.html`
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

Cool! Let's add a button that will let us actually submit the model! In the
future, this function will actually add the post to the database; for now,
we'll just have it add the post to the `posts` array. Remember, since we aren't
using a database, it won't persist on refresh--you'll lose your new post every
time you refresh the page.

In `home.html`, below the form, add `<div ng-click="submitNewPost()">submit</div>`.

In `layout.js`, in your `homeController`, add the following code:

    $scope.submitNewPost = function() {
      $scope.posts.push($scope.newPost);
    }

Congratulations! You've added a post to your posts!
