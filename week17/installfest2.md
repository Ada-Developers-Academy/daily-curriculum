#Installfest PT 2

We will be using the package manager bower during weeks 18 and 19.
For the sake of speed (and bandwidth), please follow these steps over
the weekend if you have access to a reliable internet connection.

You won't need to use this at all this weekend. We'll use it next week.


##Install NPM

[Follow the link](http://nodejs.org/) and click "Install". Then, open
the package you've downloaded and follow the instructions to install
NPM/Node.js.

We will be using NPM to install Bower. Otherwise, we won't be doing much
with NPM/Node.js, unless you choose to explore them in your project. Is
it a little silly to install this back-end framework just so we can install
a package manager? Yes. Yes it is. Welcome to the Real Developer Life (tm).


##Use NPM to install Bower

Bower is a package manager that you can use to install and manage dependencies.
It is used frequently in many companies and professional settings, though not
everywhere; some workplaces dislike bower because it installs everything in the
Github repo for the package, instead of just the single file you actually want
to use.

We will use bower, because it is a useful tool and it's good to have exposure
to it. If you have not yet installed bower, follow these steps to install it.

1) In your terminal, `mkdir blahg` wherever you want your project to live

2) `cd blahg`

3) `npm install -g bower`

4) `touch bower.json`

5) Open `bower.json` in your text editor

6) Add the following to your `bower.json` file:

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

##Use bower to install AngularJS

Open your `bower.json` file in your text editor (if you don't have that file,
go back to "Install bower"). Add the following to the `dependencies` section,
so it looks like the following:

    "dependencies": {
      "angular": "1.3.8"
    }

If you already have dependencies listed, simply add angular to that list.

Now, in your terminal, type `bower install`. You should see something like the 
following in your terminal:

    User$  bower install
    bower cached        git://github.com/angular/bower-angular.git#1.3.8
    bower validate      1.3.8 against git://github.com/angular/bower-angular.git#*
    bower install       angular#1.3.8

    angular#1.3.8 bower_components/angular

If you look at your project directory, you'll see that it now has a 
`bower_components/angular` directory. Inside that directory, there are several 
different angular files, including `angular.min.js`.