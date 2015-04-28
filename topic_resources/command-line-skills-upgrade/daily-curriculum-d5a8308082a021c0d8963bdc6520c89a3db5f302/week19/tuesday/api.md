#Hooking up the API

Let's finally, FINALLY add some data to our project! Woo hoo!


##Copying our API down

In your terminal, from your top-level `blahg` directory, `cd ..` so you are in the
directory ABOVE your `blahg` app. If you `ls`, you should see `blahg`.

Now, we'll follow the steps Bookis oh-so-kindly left for us at the [Blahg API he wrote for us](https://github.com/Ada-Developers-Academy/blahg-api)
(Thanks, Bookis!). Follow the instructions up until, but not including, "Deploy".

Don't try to do the next part until after you've followed those instructions.

Once you've done that, you can test and see if your database and API are hooked up
by navigating to `http://localhost:3000/posts` in your browser while your Rails
server is running. If you can see some json, congratulations! Your API is hooked
up!

##Making a `GET` request

Have you finished following Bookis's instructions? NO? Go do that! Then come back!

Open up your blahg app in your text editor--specifically, open up whichever 
controller you define `$scope.posts` in. It's probably either `layout.js` or 
`posts.js`, depending on how far you got in refactoring your controllers. Now, in 
this controller, delete the line that says `$scope.posts = [lots of dummy data]` and replace it with the following:

    $http.get('http://localhost:3000/posts').success(function(data) {
      $scope.posts = data;
    });

This queries the API and creates a promise object. Once that promis object hits
the 'success' state, it assigns the data--the value returned by the API--to the
`posts` model (and remember, in AngularJS, a model is a variable accessible to
the controller and the view).

Now, when you navigate to your view that prints out your posts, you should see the
posts you're pulling from the API!


##Making a `POST` request

Let's create a new post! Go to `new.html` and add a form to let us create our 
posts. It should look something like this:

    Title: <input type="text" ng-model="newPost.title"/>
    Content: <input type="text" ng-model="newPost.content"/>
    <button ng-click="submitNewPost()">Submit</button>
    {{newPost}}

This is exactly the same as the form we created a few days ago.

Let's to to `posts.js`, to the `newPostController`, to actually add the 
`submitNewPost` function. We'll use `$http` again to make that `POST` method.
It should look something like this:

    $scope.submitNewPost = function(){
      $http.post('http://localhost:3000/posts', 
        {
          post: {
            title: $scope.newPost.title, 
            content: $scope.newPost.content
          }
        })
    }

This creates a `POST` request that queries the API and sends the parameters that
we created in the view.

It's important to note that 1) there are no validations right now, so we could put
in literally anything and it would try to send the post, and 2) our view won't
reflect the changes we've made (meaning, the new post we created won't show up in
our index). Last week, we solved this issue by pushing this post object into the 
$scope.posts array. Maybe we'll want to do this again...?