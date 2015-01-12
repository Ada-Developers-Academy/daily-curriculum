#Adding AngularJS to our app/Hello World

##Follow Installfest pt2

If you haven't followed the steps in Installfest pt2, this won't work. Before
you try to do any of this stuff, go back to week17 and do the installfest homework.

##Adding NPM to run our server

Navigate to the parent directory of your app (it should be `blahg` or something
similar). It should contain one file (`bower.json`) and one directory (`bower_components`).

(A note: future versions should have you install the npm stuff first. Ellen changed her mind partway through).

In the terminal, `touch package.json`. In `package.json`, add the following code:

    {
      "name"         : "Blahg",
      "version"      : "0.0.1",
      "description"  : "My AngularJS Blahg",
      "main"         : "server.js",
      "author"       : "<YOUR NAME>",
      "dependencies" : {
        "http-server": "^0.6.1",
        "tmp": "0.0.23",
        "bower": "^1.3.1",
        "shelljs": "^0.2.6"
      },
      "scripts": {
        "postinstall": "bower install",

        "prestart": "npm install",
        "start": "http-server -a 0.0.0.0 -p 8000",
      
        "update-index-async": "node -e \"require('shelljs/global'); sed('-i', /\\/\\/@@NG_LOADER_START@@[\\s\\S]*\\/\\/@@NG_LOADER_END@@/, '//@@NG_LOADER_START@@\\n' + cat('bower_components/angular-loader/angular-loader.min.js') + '\\n//@@NG_LOADER_END@@', 'app/index-async.html');\""
      }
    }

In the terminal, `npm install` and then `npm start` to start your server.

We are adding this code so that you can run the app on a node server.

##Hooking AngularJS into your app

In the terminal, `mkdir app`, `mkdir app/views`, and then `touch app/views/layout.html`. 
Open this file in your text editor.

In `layout.html`, add the following code:

    <!doctype html>
    <html ng-app>
      <head>
        <script src="../../bower_components/angular/angular.min.js"></script>
      </head>
      <body>
        <div>
          <label>Hello? Is anybody there?</label>
          <input type="text" ng-model="hello" placeholder="Maybe a traditional greeting?">
          <hr>
          <h1>{{hello}}</h1>
        </div>
      </body>
    </html>

This code does a few things. We'll look at it line-by-line.

`<!doctype html>`: hey! It's HTML! Don't forget!

`<html ng-app>`: ng-app is an AngularJS directive that initializes an AngularJS
application. Don't ask me how we're able to use AngularJS to start using AngularJS;
it makes my brain hurt, too.

`<head>`: starts the headers for our page.

`<script src="bower_components/angular/angular.min.js"></script>`: provides our app
with the source for AngularJS. We're importing it just like you'd import jquery or
another third-party app. Here, you can see that we're pointing it at the `bower_components`
directory that we created earlier.

We're also using the minified version of our js. Minifying, in case you don't know,
is a process that removes unnecessary characters from the source before uploading.
Since we're only using the minified version of the AngularJS source code, you
could theoretically delete the other files in the `bower_components/angular` 
directory.

`</head>`: Ends the headers

`<body>`: Starts the body

`<div>`: Opens a div

`<label>Hello? Is anybody there?</label>`: Creates a label for the input we're about to create.

`<input type="text" ng-model="hello" placeholder="Maybe a traditional greeting?">`:
This does a few things. It creates an input. It sets the input type to text. It
creates a placeholder. It also uses our first ng- directive: ng-model.

Remember, ng-model takes a couple of steps here:
1) It looks to see if the model, `hello`, already exists. If it does, it sets
the value of the input to the value of that model. So, if earlier in the code we
had done `hello = 'not much'`, then in the input field, instead of seeing the
placeholder, we would see the words "not much" in the input field.

2) If that model doesn't exist, it creates a new model called `hello`

3) It sets two-way data binding with this model. This means that if you change 
the value of hello at one spot on the page, it changes in every other instance 
of that model. If you don't remember much about two-way data binding, review 
the lecture/notes from Friday.

Remember, AngularJS `ng-model` is more like a variable than like a Ruby model.

`<hr>`: A questionable stylistic decision, put there to show where `hello` begins.
          
`<h1>{{hello}}</h1>`: Displays the value of hello

`</div>`: Closes the div

`</body>`: Closes the body

`</html>`: Closes the html

##Testing our AngularJS

In your browser, navigate to this page. 

(Protip: it's probably easiest to go to your terminal window, type `open .`,
and then either double-click on the file or right-click and then open with 
your browser)

In your input field in your browser, type "Hello World". If the words "Hello World"
show up in your browser underneath the `hr`, congratulations! You just started
your AngularJS app!




##For the rest of your day

Continue to work on the AngularJS tutorial until you have completed it. Take notes
about what things you want to understand better and spend more time talking about.

Begin working on the views in your app. At this point, focus on playing around with
AngularJS directives and view logic. We'll add controllers and routes tomorrow,
which will allow you to create more advanced sites.