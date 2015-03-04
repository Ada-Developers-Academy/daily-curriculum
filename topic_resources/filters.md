#Filters!

Filters in AngularJS are awesome. They allow you to do a lot of really cool things
with data representation and visualization, really quickly and easily.


##What are filters in AngularJS?

Filters in AngularJS format expressions. Usually, you use them in the view. While
it is possible to filter in your controller, I have basically never seen that,
so we'll focus on using filters in your view.


##General formatting syntax

Filters look like this: `{{ expressionToFilter | filterFunction:argument1:argument2 }}`. 

`expressionToFilter` is the expression we are going to filter/format; typically,
this is either an array or a single expression/argument, like a string or an
object.

`filterFunction` is either one of several different filter functions that come 
with AngularJS, or a function that you have created somewhere else. That's right, 
you can create custom filters! 

Sometimes, filters have arguments, and you add them by appending `:ARGUMENT` to
the filter function. We'll look at some examples of that shortly.

There is documentation for the different filter functions that come with AngularJS 
right out of the box [here](https://docs.angularjs.org/api/ng/filter), and it is
extensive. 

There are a lot of different kinds of filters that are very useful, but 
particularly good ones to know include `filter:foo`, which does not display 
expressions that do not include `foo`; this looks like the standard search you are
used to, and in fact we implement this filter in phonecat to search for phone types.
Other important filters include `orderBy:foo`, `date`, and `uppercase`. In my
experience, I have also written filters that will capitalize the first letter
of a string and make the rest of the string lowercase. 


##Filtering to change the data display

So, filters are a kind of formatting; what might we want to format in our app?
HINT: date objects! YAAAAAY!

Go to `home.html` and find the place where we put `post.date`. Replace that line of
code with `<small>{{post.date | date:'EEEE'}}</small>` and then refresh it in the
browser. That's pretty cool, huh? You can find other formats to use instead of this
EEEE format [here](https://docs.angularjs.org/api/ng/filter/date).


##Adding a broad search

Let's add a search that will let us look at the content in our posts.

Near the top of `home.html` but still inside your `ng-controller`, add the line
`broad search: <input type="text" ng-model="search">`. Next, find the line of
code that includes `ng-repeat: post in posts` and update the `ng-repeat` so that
it reads `ng-repeat: post in posts | filter:search:strict`.

What we just did was create a text input with an `ng-model` called `search`.
We then added a filter to our post repeater telling it to only include posts
that have our search term, though we did not specify whether we wanted it to look
for this search term in the title, the body, or somewhere else. Take a little time
to try different search terms and play with this feature. Think about how hard it
would be to implement this feature with a regular Rails app.


##Adding a slightly more specific search

Let's get more specific: let's add a search bar that lets us look just at the titles
of our posts, just in case we remember what that awesome post was called but not
when it was posted.

Add another input with a more specific `ng-model`. It should look like 
`title search: <input type="text" ng-model="search.title">`.

Okay, that should be it! You should be able to go to your refreshed browser and
now have a search bar that only looks at values in the title.


##Just searching tags

So, we're going to be using tags on our posts, and I beeeeet that we'll be able
to filters to sort by tags.

Standard sort-by-tags UI usually involves clicking on tags in a list of tags, so 
let's start by creating this list. In `layout.js`, we're going to create a new 
array to hold our tags in our controller with `$scope.tagArray = [];`. Let's also
reuse some of the code we used to toggle tags in our model. We'll grab parts of 
`$scope.toggleIds`, like so:

    $scope.addTag = function(id) {
      i = $scope.tagArray.indexOf(id);
      if(i == -1) {
        $scope.tagArray.push(id);
      } else {
        $scope.tagArray.splice(i, 1); 
      }
    }

And now, we'll copy some of the view code we created to show our tags in order to
create a tag bank we can select. Add the following code near the top of `home.html`
(near the top, but still in the `ng-controller`):

    <span ng-repeat="tag in tags">
      <input type="checkbox" value="tag.id" ng-click="addTag(tag.id)">{{tag.name}}</input>
    </span>

So right now, we have a new array called tagArray, and we can add and remove tags
from it by selecting the checkboxes. We can test this theory by printing the
tagArray with a `{{tagArray}}` somewhere in the view.

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

We'll follow this syntax to create a filter to only show posts that include the
tags that we put in. To do this, we'll add the following block of code inside the 
`layout.js` file, but NOT within the controller--this should go at the very bottom
of the file, outside the controller.

    homeControllerModule.filter('selectedTags', function() {
      return function(posts, tagArray) {
        return posts.filter(function(post) {
          for (var i in posts) {

            // shows all posts if no tags have been added to the array
            if (tagArray.length == 0) {
              return true;
            } else {

              // remember that .indexOf returns -1 if the item is not in the array.
              // this filter returns true if the tag IS in the array.
              if (tagArray.indexOf(post.tag_ids[i]) != -1) {
                return true;
              }
            }
          }

          // returns false if it hasn't already returned true
          return false;

        });
      };
    });

Now, if we go to the `home.html` and update the `ng-repeat="post in posts" line and
update it to the following:

    <div ng-repeat="post in posts | filter:search:strict | selectedTags:tagArray:true">

we should now be able to filter based on both the words we provide in the inputs and 
based on tags we select.