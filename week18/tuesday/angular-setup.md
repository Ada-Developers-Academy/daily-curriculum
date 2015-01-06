#Adding AngularJS to our app/Hello World

##Install bower

Bower is a package manager that you can use to install and manage dependencies.
It is used frequently in many companies and professional settings, though not
everywhere; some workplaces dislike bower because it installs everything in the
Github repo for the package, instead of just the single file you actually want
to use.

We will use bower, because it is a useful tool and it's good to have exposure
to it. If you have not yet installed bower, follow these steps to install it.

1) In your terminal, navigate to the root of your project directory
2) `npm install -g bower`
3) `touch bower.json`
4) Open `bower.json` in your text editor
5) Add the following to your `bower.json` file:

  {
    "name": "Blahg",
    "version": "0.0.0",
    "authors": [
      "YOUR_NAME_OR_GITHUB_HANDLE <YOUR_EMAIL(OPTIONAL)>"
    ],
    "description": "a super cool angular app",
    "main": "layout.html",
    "dependencies": {
    }
  }

This file frequently contains information about the license, version, github
repo, main URL, etc. We don't need as much information in our file.

##Using bower to install AngularJS

Open your `bower.json` file in your text editor (if you don't have that file,
go back to "Install bower"). Add the following to the `dependencies` section,
so it looks like the following:

    "dependencies": {
      "angular": "1.3.8"
    }

If you already have dependencies listed, simply add angular to that list.

Now, in your terminal, type `bower install`. You should see something like the following in your terminal:

    User$  bower install
    bower cached        git://github.com/angular/bower-angular.git#1.3.8
    bower validate      1.3.8 against git://github.com/angular/bower-angular.git#*
    bower install       angular#1.3.8

    angular#1.3.8 bower_components/angular

If you look at your project directory, you'll see that it now has a 
`bower_components/angular` directory. Inside that directory, there are several 
different angular files, including `angular.min.js`.

##Hooking AngularJS into your app

If you have a layout.html file, navigate to it; if not, `touch layout.html`.
Open this file in your text editor.

In `layout.html`, add the following code:

    <!doctype html>
    <html ng-app>
      <head>
        <script src="bower_components/angular/angular.min.js"></script>
      </head>
      <body>
        <div>
          <label>What's up?</label>
          <input type="text" ng-model="whatsUp" placeholder="Maybe a traditional greeting?">
          <hr>
          <h1>{{whatsUp}}</h1>
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

`<label>What's up?</label>`: Creates a label for the input we're about to create.

`<input type="text" ng-model="whatsUp" placeholder="Maybe a traditional greeting?">`:
This does a few things. It creates an input. It sets the input type to text. It
creates a placeholder. It also uses our first ng- directive: ng-model.

Remember, ng-model takes a couple of steps here:
1) It looks to see if the model, `whatsUp`, already exists. If it does, it sets
the value of the input to the value of that model. So, if earlier in the code we
had done `whatsUp = 'not much'`, then in the input field, instead of seeing the
placeholder, we would see the words "not much" in the input field.

2) If that model doesn't exist, it creates a new model called `whatsUp`

3) It sets two-way data binding with this model. This means that if you change 
the value of whatsUp at one spot on the page, it changes in every other instance 
of that model.

Remember, AngularJS `ng-model` is more like a variable than like a Ruby model.

`<hr>`: A questionable stylistic decision, put there to show where `whatsUp` begins.
          
`<h1>{{whatsUp}}</h1>`: Displays the value of whatsUp

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
your first AngularJS app!