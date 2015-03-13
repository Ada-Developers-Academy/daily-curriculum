#Custom Services, Factories, and Directives

Services, factories, and directives are all data structures that you can use to
refactor your views and controllers. A large, well-structured app will likely
make use of all three. Custom directives have functionality that it's pretty easy
to isolate, but unfortunately, the line between services and factories is a lot
fuzzier. A lot of different resources that talk about services and factories use
those words interchangeably while defining the difference between them, which 
really doesn't help. In this lesson, we'll try to tease apart the differences
between the three and in what case we might use each of them.


##Directories

Directories are the easiest of the three to isolate, so we're going to talk about
them first, despite the fact that they're listed last in the title (this is 
terrible practice and you shouldn't ever do it, ha).

Directives as we have seen them thus far have been bits of Angular-specific code
that we put in our view to let us observe and react to events in the browser, such
as `ng-click`, which lets us respond to click events, `ng-keypress`, which lets us respond when a key is pressed, and so on.

You can also create directives that do custom actions, however. For example, 
right now for tags we have check boxes that we click on and then we run methods 
in our controller to add these check boxes to the appropriate arrays and do 
filtering or object creation. Since this is a custom function that we want to run 
based off of an event that happens in the view, and since we want to use this 
functionality in a couple of different places, we could add a custom directive 
that does that logic for us.

Directives are relatively easy to understand, but it's harder to create custom 
directives. We'll look at them more tomorrow.





`app.js`

    var blahgApp = angular.module('blahgApp', [
      'ui.router',
      'homeControllerModule',
      'postsControllerModule',
      'servicesModule'
    ]);

`layout.js`

update calls to `apiService.postPost($scope.newPost)` and `apiService.get('/posts')` and `apiService.get('/tags')`

`touch app/js/services.js`

    var servicesModule = angular.module('servicesModule', []);

    servicesModule.factory('apiService', ['$http', function($http){
      var url='http://localhost:3000';
      return{
      get: function(page) {
        return $http.get(url + page);
      },
      postPost: function(post) {
        return 
          $http.post('http://localhost: 3000/posts',
            {
              post: {
                title: post.title,
                content: post.content
              }
            }
          );}
      }
    }]);

`index.html`

`<script src="app/js/services.js"></script>`