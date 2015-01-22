#Refactoring: part 2

What are the basic steps we take when we take a large, bloated controller and 
view and refactor it into smaller pieces?

We're going to look at pulling out the logic for our index page as an example.


##1) Create our new controller and view

Decide which module is the most relevant module--example: most of our post
logic will go in the `postsControllerModule`--and create the controller.

We went over this in lesson [Routing, part 2](../week18/friday/routing-pt-2.md)
last Friday; you should already have a `postsControllerModule`, a 
`postsController`, and the associated views and routing. If you don't, please 
go back to that lesson and make sure you're following all of the steps. We'll 
go over this again in our refactor-along, too. Your controller should look 
something like this:

    postsControllerModule.controller('postsController', ['$scope', '$http', function($scope, $http){
      $scope.name = "posts controller yay!";
    }]);


##2) Decide what functionality we want to have on that page and what already exists on a different page

Make sure you know what you're trying to do before you do it! On our index 
page, we want to show every post we have, with their associated tags. We also 
want to be able to search/filter these posts. All of that functionality 
already exists on our `home.html` page.


##3) Begin adding logic, starting with the view and with the smallest possible piece of this view you can think of

This is where some of you are getting in trouble. You should never ever EVER just copy and paste a really big chunk of code from one spot to the next. Instead, start with the smallest piece you can think of and go from there.

We'll start our refactor by trying to display `posts`. We aren't going to do any formatting or anything fancy with it yet; let's just try to get the data on the page.

We'll start by going into our `posts.html` view and, inside our `<div ng-controller>`, adding `the posts are {{posts}}`. If we refresh our page, we'll see that there aren't any posts displaying!

`posts` is an array, and more importantly, it's a model (that's a variable made available to both the controller and the view). Let's find where we're creating that model in the code we already have.

If we look at that code, we see our service call
let's copy the service call
add an ng-repeat, which has this format and does this thing
hey, getTagNames isn't working, let's look at why