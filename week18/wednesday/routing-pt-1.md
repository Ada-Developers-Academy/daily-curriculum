[Recording, which starts partway through](https://www.youtube.com/watch?v=6SBRejAM9p8)

#Routing Pt 1: Routing and Controllers 101

In this lesson, we'll create our first controller and define our route to
that page. The goal for this lesson is to look more closely at controller
code and to start putting our app together.

##Adding Angular-Route

AngularJS has a library that handles routing for you. It's called Angular Route.
In order to use this library, we'll first have to install it with bower.

Update `bower.json` so that the `"dependencies"` object looks like this: 

      "dependencies": { 
        "angular": "1.3.8",
        "angular-ui-router": "latest"
      } 

Run `bower install`. The output in your 
terminal should look something like this:

    $ bower install
    bower angular-ui-router#*   not-cached git://github.com/angular-ui/ui-router.git#*
    bower angular-ui-router#*      resolve git://github.com/angular-ui/ui-router.git#*
    bower angular#1.3.8         not-cached git://github.com/angular/bower-angular.git#1.3.8
    bower angular#1.3.8            resolve git://github.com/angular/bower-angular.git#1.3.8
    bower angular-ui-router#*     download https://github.com/angular-ui/ui-router/archive/0.2.13.tar.gz
    bower angular#1.3.8           download https://github.com/angular/bower-angular/archive/v1.3.8.tar.gz
    bower angular#1.3.8            extract archive.tar.gz
    bower angular#1.3.8           resolved git://github.com/angular/bower-angular.git#1.3.8
    bower angular-ui-router#*      extract archive.tar.gz
    bower angular-ui-router#*     resolved git://github.com/angular-ui/ui-router.git#0.2.13
    bower angular#1.3.8            install angular#1.3.8
    bower angular-ui-router#*      install angular-ui-router#0.2.13

    angular#1.3.8 bower_components/angular

    angular-ui-router#0.2.13 bower_components/angular-ui-router
    └── angular#1.3.8


##Creating the app

Open `layout.html`. Add the following lines:

    <script src="../../bower_components/angular-ui-router/release/angular-ui-router.js"></script>
    <script src="../js/app.js"></script>

This will load the angular-ui-router file we just installed with bower, plus a file 
we are about to create.

In your console, `mkdir app/js`, and then `touch app/js/app.js`. Open `app/js/app.js`
in your text editor.

Now, we actually create the app. In order to create the app, we'll add the following
code to `app.js`:

    var blahgApp = angular.module('blahgApp', [
      'ui.router',
      'homeControllerModule'
    ]);

This creates a new angular module, called blahgApp. It uses dependency injection to
incorporate the library `ui.router` and the module `homeControllerModule`, which we 
have not yet created.


##Dependency injection

Dependency injection is a tool that Angular uses to manage loading modules and parts
of the app asynchronously.

Load order is an issue that we face frequently, since dependencies can become very
complex. If you load a file before you load the files it depends on, it won't work.
We can see this in our HTML. If we go to `layout.html` and move the `script`line `src="../js/app.js` above all of the other `script`s we load, we get an error in our console and our 
app does not work.

Synchronous languages, like HTML, control this issue by loading every file in the order
they are provided. Asynchronous languages like JavaScript, however, do not do this, and
thus JavaScript frameworks typically load files asynchronously, as well. In order to make
sure that all dependencies are loaded before a file is loaded, AngularJS uses a software
design pattern called dependency injection.

You will see dependency injection throughout all of AngularJS. Many AngularJS functions
look like this:

    moduleName.controller('MyController', ['foo', 'bar', function(foo, bar))

This creates a new controller named `MyController`. `MyController` has dependencies named
`'foo'` and `'bar'`. As the code here is executed, once it hits the first `'foo'` and `'bar'`
(the ones next to the `[` bracket), it looks for a provider (typically a module) named "foo"
and a provider named "bar." Once it has those providers (plus their dependencies), it injects 
the `foo` and `bar` modules into the controller.

This knit-together dependency injection structure allows you to explicitly name any
dependencies in each function, and to add them at the necessary point in the execution
of the app.

At this point, I would recommend not thinking too terribly hard about the specifics of how
dependency injection works; all it will do is make your brain hurt. Important parts to
remember are:   

1) You need to inject any dependencies before you use them.   
2) This injection occurs as the first few arguments in the array passed to a function      
3) You must then pass all or part of the module you injected as a variable to that function    
4) An "unknown provider" error occurs when this injection did not work correctly


##Configure the app

Let's configure our app. In `app.js`, below all of the lines you added previously
(and outside of the block you made previously) add the following line:

    blahgApp.config(function($stateProvider, $urlRouterProvider) {
        $stateProvider
        .state('home', {
          url: '/home',
          templateUrl: '../views/home.html',
        })
      $urlRouterProvider.otherwise('/home');
    });

This starts a `config` function on our app. We'll pass in a few providers that come from
ui.router. After that, it uses the `$stateProvider` to list a new state, called "home".
This state should be invoked at the `'/home'` URL, and it renders the template `'../views/home.html'`.

We provided a default url, as well: `'/home'`

##Creating the controller

Since we're using the MVC structure for our app, we'll need to create a directory
to hold our controllers. `mkdir app/js/controllers` and then `touch app/js/controllers/layout.js`.
We're creating this controller directory inside our `app/js` directory because this
is consistent with the structure you'd see if this were integrated into an MVC app.

Open up `app/js/controllers/layout.js` in your text editor and add the following code:

    var homeControllerModule = angular.module('homeControllerModule', []);

    homeControllerModule.controller('homeController', ['$scope', '$http', function($scope, $http) {
      $scope.hello = "Hi";
    }]);

This creates a new controller module, called homeControllerModule, and adds `$scope` and
a `$scope` element.


##Update views

Open `layout.html` in your browser. Find the part where it says `ng-app`, and update
it to `ng-app="blahgApp"`. Then, touch `app/views/home.html`.

In `layout.html`, copy the contents of the `body`. Paste the contents in `app/views/home.html`.
Add a `div ng-controller="homeController"` around the contents of `app/views/home.html`. 
Then, return to `layout.html` and add `div ui-view` to the `body`.

`layout.html` should look like this:

    <!doctype html>
    <html ng-app="blahgApp">
      <head>
        <script src="../../bower_components/angular/angular.min.js"></script>
        <script src="../../bower_components/angular-ui-router/release/angular-ui-router.js"></script>
        <script src="../js/app.js"></script>
        <script src="../js/controllers/homeController.js"></script>
      </head>
      <body>
        <div ui-view>
        </div>
      </body>
    </html>

`home.html` should look like this:
  
    <div ng-controller="homeController">
      <label>Hello? Is anybody there?</label>
      <input type="text" ng-model="hello" placeholder="Maybe a traditional greeting?">
      <hr>
      <h1>{{hello}}</h1>
      {{howdy}}
    </div>

Now, you should be able to navigate to `http://localhost:8000/app/views/layout.html#/home`
in your browser window and see your view! You should also be able to replace `/home`
with anything in the URL there and be redirected to `/home`

##What the heck did we just do?

1) We updated our dependencies in `bower.json` to include `angular-ui-router`

2) We created an actual Angular app in `app.js` and we added some initial routing to it.

3) We created a controller with a `$scope` element in `homeController.js`

4) We created a partial view, `home.html`

5) We updated some script loading and rendered a partial view in `layout.html`
