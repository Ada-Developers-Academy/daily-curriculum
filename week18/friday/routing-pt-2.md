#Routing, part 2

It's time to look at some more advanced routing, and to practice creating another
controller module. Let's create a postsControllerModule with links, a nested partial,
and a URL that takes a parameter.

##Making a new controller module

Let's add a simple new controller module!

Navigate to your terminal and `touch app/js/controllers/posts.js`. Open this file up in
your text editor and we can create this module! Start by initiating the controller on
the top of the file:

    var postsControllerModule = angular.module('postsControllerModule', []);

We'll add a few controllers to our module soon.

Now we'll inject this module in our app. Go to `app.js` and add `'postsControllerModule'`
to your the app module, so it looks like the following:

    var blahgApp = angular.module('blahgApp', [
      'ui.router',
      'homeControllerModule',
      'postsControllerModule'
    ]);

Don't forget to import this file we created in your `index.html`! In `index.html`, under
the other `script` tags, add `<script src="app/js/controllers/posts.js"></script>`.

At this point, we've created a controller module and injected it into all of the 
appropriate places in our app. Next, we'll actually do something with this module,
instead of just using it to take up space!

Remember as we start creating these new pages that there are four steps to every new
view: creating the controller, creating the route, creating the view, and linking
to the new view.


##Creating a simple route with a link (index page)

###Create the controller

Let's start with an index page. In `posts.js`, underneath the module we created in the 
step before, create a new controller. In AngularJS convention, an index controller is
the name of the module, pluralized--in this case, postsController.

    postsControllerModule.controller('postsController', ['$scope', '$http', function($scope, $http) {
    }]);

In our actual index controller, we'll want some logic to pull all of the posts from
the API. Later on today, I recommend that you move some of the logic that's currently
in the `homeController` and on `home.html` into this controller and view, but for now,
we'll just add a `$scope` variable that we can display to show that we're definitely
connecting our controller and our view. Add `$scope.name = "Posts Controller"` inside
the `postsController`--and make sure that it's INSIDE the controller, between where the 
function opens and where it closes!

###Create the route

Open up `app.js` in your text editor. Right now, it should just have the creation of 
the blahgApp module (including the stuff we're injecting into it), the `home` route,
and a default (`otherwise`) that also routes to `home`.

We'll add a route to posts here. This route should be chained onto the other route on
the `$stateProvider`, with the `$urlRouterProvider` on the line before--so the structure
of this page looks like this:

    var blahgApp = angular.module('blahgApp', [
      //some stuff we're injecting here
    ]);

    blahgApp.config(function($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('home', { //code }).state('posts', { //code }).state('etc etc', {//code});
      $urlRouterProvider.otherwise('/');
    });

So, below the first `.state` method call, chained onto it, add the following:

    .state('posts', {
      url: '/posts',
      templateUrl: 'app/views/posts.html',
    })

This will tell our server to serve up the `app/views/posts.html` view when either the 
`/posts` url or the `.posts` state is hit.

###Create the view

In your terminal, `touch app/views/posts.html`. Open this file in your text editor.
Eventually, we'll want to add a lot of other code here to actually show our posts, but
in the meantime we'll just attach our controller to the view and show that variable
we created. So, in this file, put:

    <div ng-controller="postsController">
      {{name}}
    </div>

###Link to the new view

We have a cool new view, but it isn't terribly useful if we can't actually get to it,
so let's add a link from our `index.html`!

In `index.html`, inside the body and above the `ui-view`, put

    <div class="header">
      <a ui-sref=".home">Home</a>
      <a ui-sref=".posts">Posts</a>
    </div>

This just creates a nice div we can later style into a nice header, and it creates a link
back to the home page. It also creates a link to the index page.

`ui-router` uses `ui-sref` instead of `href`. This is one of the ways that `ui-router` is
different than `ng-router`. The biggest difference between the two is that `ui-router` 
allows you to have nested views on a page, while `ng-router` does not--so with `ui-router`,
you can have more than one partial on a page, but with `ng-router` you can only ever have
one `ui-router` at a time. Another difference is that `ui-router` uses states in addition
to true routes; the distinction between the two is not terribly important right now,
other than that we use `ui-sref` when linking to different views/partials.

Alright, refresh your page, click on that link, and see your views change!


##Creating a nested partial (new post on the index page)

Since we're using this `ui-router` library, which allows us to have nested views, let's
go ahead and create one. We'll add a partial to our index page, to let us put our form
directly in this page when the user clicks on a button.

Developers also sometimes use nested views to render modals.

###Create the controller

We start, of course, with the controller. Since we'll be using this view to create new 
posts, let's put it in `posts.js` and add it to the postsControllerModule. We'll create
the controller and put a noticeable variable in it, just like we did with the other
controller. In the bottom of `posts.js`, put the following:

    postsControllerModule.controller('newPostController', ['$scope', '$http', function($scope, $http) {
      $scope.newName = "new posts controller"
    }]);

###Create the route

Since we're creating a nested partial/view instead of a regular one, the routing looks
a little different here. Instead of just naming our route normally and using the 
regular `templateUrl`, we'll create an addendum to the route we have, with 'views'. 
Add the following right to the end of the code we wrote before, so it looks something 
like this:

    //previous code starts
    .state('posts', { //etc etc }) //previous code ends, new code starts
    .state('posts.new', {
      url: '/new-post',
      views: {
        'new': {
          templateUrl: 'app/views/new.html'
        }
      }
    })

NOTE: if you're copying/pasting, you should know that I'm pretty sure keeping comments
in the middle of these objects will break things.

###Create the view

In your terminal, `touch app/views/new.html`. Then, in that file, add:

    <div ng-controller="newPostController">
      new name is: {{newName}}
      name is: {{name}}
    </div>

###Link to the new view

The way we link to this view is a little different, too. Since we're rendering it inside
a ui-view that already exists, it already has the current state of `posts`, and we're
adding to that state.

In `posts.html`, put:

    <a ui-sref=".new">add a post</a>
    <div ui-view="new"></div>

Refresh your view, and spend a little time looking at this. Pay attention to what happens
with the URL, and what values you see for `newName` and `name`.


##Creating a view/controller that takes a parameter (show page)

###Create the controller

Again, we're going to put the controller in `posts.js`, since it belongs in the 
`postsControllerModule`. Again, we're going to put a little data in here. The big 
difference here is that we're going to add the `$stateParams` dependency.

`$stateParams`, like `$scope` and `$http`, is part of a module that comes with AngularJS
out of the box. `$stateParams` gives us access to the parameters that we will pass to it
via `ui-sref`. Here, we'll save both an arbitrary `$scope.name` model, and we'll look
at `$scope.id`, which is a model we'll create to look at `$stateParams.id`.

postsControllerModule.controller('postController', ['$scope', '$http', '$stateParams', function($scope, $http, $stateParams) {
  $scope.postName = "this is the post/show view!"
  $scope.id = $stateParams.id;
}]);

###Create the route

The route we'll create here is structurally the same as our first two routes (the routes
that weren't partials), other than we'll add an id parameter to them. Just like our
other routes, we're chaining this to `$stateProvider`. It should look something like

    .state('show', {
      url: '/post/:id',
      templateUrl: 'app/views/show.html'
    })

###Create the view

Aaaand just like before (are you sensing a theme? Do you see how easy this can be?) we'll
go to our terminal and add `touch app/views/show.html`. Again, just like before, we won't add a whole lot to our view right now. Instead, we'll take a look at the models
we created so we can 1) verify that we're looking at the right view, and 2) take a look
at the parameter we're passing so we can see what it looks like.

Open `show.html` in your text editor and add the following:

    <div ng-controller="postController">
      name is {{postName}}
      id is {{id}}
    </div>

###Link to the new view

Our link here will look pretty much the same as our first links, but we'll pass our 
parameter, as well.

We'll put our link in `home.html` so we can dynamically grab the id we're using in the
link. Open `home.html` and find the line where you print the title of the posts. It 
should look like `<h2>{{post.title}}</h2><br>`. We're going to wrap it in an anchor
tag with a link to our new view. It should look like this:

    <a ui-sref="show({id: post.id})">
      <h2>{{post.title}}</h2><br>
    </a>


##YAAAAAAY

We did it! Let's review what we've done so we know how we can proceed with our blahg.

1) Formatted an array of posts
2) Formatted and wrote a little code wrapper around a post input
3) Created search bars to let us sort by contents or by tags
4) Created standard routes/views
5) Created nested routes/views
6) Created routes/views that take a parameter

Now, with some refactoring, we can turn this app with one big, kind of strange view
into a logical, "multi-page" app that's really fast and slick!

If you're working on the blahg, try moving `$scope.posts` and the posts-view logic into
the `postsController` and `posts.html`. Move the new post logic, as well. Think about 
what you want to do with the home page. You can move a lot of this logic around to the
appropriate places with all of the cool things you've learned!