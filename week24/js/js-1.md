# Getting Set Up

Make sure that you have node and npm installed. You can see the version of node by running ```node -v```:

```
(dean)-(jobs:2)-(~/Devel/Ada/js-playground[master*])
(! 631)-> node -v
v0.10.35
```

Similarly, you should see a version when you run ```npm -v```:

```
(dean)-(jobs:2)-(~/Devel/Ada/js-playground[master*])
(! 632)-> npm -v
2.1.14
```

Both node and npm are available for install via homebrew; if you don't have them you can install them with ```brew install node``` and ```brew install npm```.

Once you have node installed, you can set up a new JS project by cloning the js-playground template:

```
$ git clone git@github.com:Ada-Developers-Academy/js-playground.git
```

Change into the js-playground directory:

```
$ cd js-playground
```

We're also using the command line ```grunt``` tool:

```
$ npm install -g grunt-cli
```

node.js projects use ```npm``` to manage external libraries. npm modules are similar to ruby gems, and are managed via the ```package.json``` file in the root of your project, which is similar to ```Gemfile``` in a ruby project that uses bundler.

Take a look at your ```package.json```:

```
(dean)-(jobs:2)-(~/Devel/Ada/js-playground[master*])
(! 635)-> cat package.json
{
  "name": "js-playground",
  "version": "0.1.0",
  "devDependencies": {
    "browserify": "^9.0.3",
    "chai": "^2.0.0",
    "grunt": "^0.4.5",
    "grunt-browserify": "^3.4.0",
    "grunt-contrib-connect": "^0.9.0",
    "grunt-contrib-jshint": "^0.11.0",
    "grunt-contrib-uglify": "^0.8.0",
    "grunt-contrib-watch": "^0.6.1",
    "grunt-simple-mocha": "^0.4.0",
    "mocha": "^2.1.0"
  },
  "dependencies": {
    "jquery-browserify": "^1.8.1"
  }
}
```

```package.json``` specifies the libraries and versions of those libraries that your project uses. The libraries are separated into two classes: development dependencies "devDependencies", and main project dependencies "dependencies." devDependencies are used for development only; they are installed locally, but not packaged with your final app.

Let's install the packages with npm:

```
$ npm install
```

This is similar to doing a ```bundle install``` in a rails app.

## Exploring the project

Let's take a look at what we have in our project directory:

```
(dean)-(jobs:2)-(~/Devel/Ada/js-playground[master*])
(! 640)-> ls -1
Gruntfile.js
README.md
build/
index.html
lib/
node_modules/
package.json
src/
test/
```

```Gruntfile.js``` - We're using a tool called ```grunt``` to manage our builds. Grunt is a lot like rake; it runs predefined tasks to help us test, verify, and build our code. In this sense ```Gruntfile.js``` is the equivalent to a Rakefile.

```README.md``` - Our README. Take a look!

```build/``` - The build directory. It's useful to precompile and concat JS files for performance and convenience. This is where the built JS files end up. You should not edit the files in this directory.

```index.html``` - A test web page that runs the JS in your project. We can start a local server to serve this file on port 3000 by running ```grunt server```

```lib/``` - This directory is for 3rd party libraries that aren't availble via npm. You rarely need to edit the code here.

```node_modules/``` - This directory contains all the npm modules that you've installed via ```package.json```. The files in this directory are managed by npm. This directory should be in your ```.gitignore```.

```package.json``` - A description of your project ans its dependencies.

```src/``` - The directory for your JS code. ```src/index.js``` is the entry point for your JS code. You will need to require other files from there.

```test/``` - A directory for your specs and/or unit tests. You can run your tests with ```grunt test```.

## Grunt

Let's take a look at our build tool, ```grunt```. You can see the command line options and available tasks in the current project by running ```grunt --help```:

Try running the server with ```grunt server```. Once the server is running, you can point your browser at http://localhost:3000, which should execute the code in ```src/index.js```. Try modifying the code and refresh your browser to see the changes.

You also use ```grunt test``` to run your tests. Modify the code in ```test/try-test.js``` to make your tests fail.

We're using mocha and chai as our test framework. You can read about the varous test methods that are available to you on the [Chai website](http://chaijs.com/api/assert/).

## require

We're using an npm module called [browserify](http://browserify.org/) which allows us to separate our JS into multiple files using the module pattern specified in the [CommonJS specification](http://wiki.commonjs.org/wiki/CommonJS). Node also uses the CommonJS module pattern–browserify allows us to us the same pattern for code reuse in both node and in our client code for the browser.

Add ```var m = require('./module');``` to your index.js file and refresh your browser. You should see the console message defined in the file displayed in your JS console.

Take a look at the variable m–try running its methods and looking at its properties.
