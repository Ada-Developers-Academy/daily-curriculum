#Let's fix that ugly URL

Okay, moment of extreme honesty: Ellen thought that she remembered this being an 
AngularJS issue, but it isn't, it's a server configuration/directory structure issue. 
Had she had time to investigate it at the beginning of the week, we would have
structured our app differently, but she didn't, so we're changing it now.

Ellen did learn some things about the way files and servers work, though, and that's
pretty cool.

This is also a good time to point out that she spent around 3 hours figuring out how
to resolve this issue, and it turned out to be a pretty easy fix. Welcome to Real
Developer Life &trade;. Ellen spent 3 hours resolving this relatively simple issue, and 
she's a real live professional developer, who does this for money. A lot of the time,
googling, frustration, and `git add .`/`git stash` after a lot of bad leads is what being
a Real Developer &trade; is like.

The sources of this problem:

1) Our servers looks for and tries to render `index.html`. If that file is in the root
directory, then when you navigate to `localhost:8000`, it shows the contents of that 
page. If it isn't, however you have to navigate to 
`localhost:8000/route/to/the/file/layout.html#/` to see the pages you want to render.

I tried simply telling our server to serve up `layout.html` in the location that it was
already in, BUUUUUT 

2) Your server can't actually access anything upstream in the directory from its load 
point--so, from `views/layout.html`, we can't access `bower_components` without more 
libraries/frameworks/etc.--the server won't do it out of the box.

To resolve this issue, we needed to follow four steps: move and rename `layout.html`, 
tell our server to load from the parent directory, update the relative file paths in our 
`index.html`, and update the relative file paths in `app.js`.


##1) Move and rename `layout.html`

Right now, you have a file called `layout.html`, and the path to that file is
`blahg/app/views/layout.html`. We want that file to be at `blahg/layout.html`.

In your terminal from the project root directory (from `blahg`), type 
`mv app/views/layout.html ./index.html`.


##2) Tell our server to load from the parent directory

Open `package.json` in your text editor. There should be a line inside the `scripts` 
block that starts with `start`. We're going to update the second argument in that line, so it looks like this:

    "start": "http-server ../blahg-with-students -a 0.0.0.0 -p 8000 "


##3) Update the relative file paths in our `index.html`

Now that `index.html` is in a different directory, we need to update our relative paths
to this file. before, `./` was `views`; now, `./` is `blahg`.

Open up `index.html` in your text editor. You should have four `script` tags. Let's 
update the relative paths: instead of navigating up to the directory with `../`, we'll
need to navigate down.

Update the `script` tags to the following:

    <script src="bower_components/angular/angular.min.js"></script>
    <script src="bower_components/angular-ui-router/release/angular-ui-router.js"></script>
    <script src="app/js/app.js"></script>
    <script src="app/js/controllers/layout.js"></script>


4) Update the relative paths in `app.js`

Similarly, we'll need to update our information in `app.js`, so open up `app.js` in your
text editor. Update your `$stateProvider` text so it looks like this:

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'app/views/home.html',
      });
    $urlRouterProvider.otherwise('/');


Woo hoo! Now, we should be able to navigate to localhost:8000 and (hopefully) be 
redirected to our Angular app!