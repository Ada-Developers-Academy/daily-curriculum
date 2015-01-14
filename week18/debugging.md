#How do I debug JavaScript?

##1) Keep your console open

This means your JavaScript console in your browser. In Chrome, you can open
this window by right-clicking on an element and then clicking "inspect element."
Then, in the small window that appears, make sure you're in the "console" tab.
This is where your `console.log()` statements appear.

Just about all of the errors you encounter will appear here, so keep it open.

##2) Save as global variables in console

Once you have a variable in your console, and you don't know what method you need
from it to get the data you need, you can right-click on the element in your
browser console and save it as a global variable. Once it's saved as a global 
variable, you can run methods on it and play with the data in your browser
until you have the line of code you need to plug into your .js file.

##3) Put breakpoints in your browser

In your browser, right-click on an element in your browser and click "inspect
element". In the window that pops up, select the "source" tab. If it prompts you
to select a source file, select the appropriate source file.

Now, you can click on a line number to add a breakpoint. You can refresh your page,
click on elements, etc. and once your browser hits that line, it will pause the code.
You can now hover over variables in the source tab to see what the browser thinks
that variable.

#How do I debug AngularJS?

##1) Use brackets to sanity-check your view and variables a lot

Not sure why your `ng-repeat="foo in foobars"` isn't working? First, put
`{{foobars}}` in your view. Does it look like what you'd expect? If so,
try `{{foo}}`.

I do a lot of sanity checks. I put little bits of nonsense into my view or my
console to make sure everything is what I expect--you might have noticed this 
on Friday. It's really easy to rabbit hole when you work on something new
(meaning to dive really deep into something that isn't actually useful or what
you should be looking at), so do a lot of sanity checks like this to make sure
that you're dealing with the data you think you should be dealing with.

##2) Check your $scope

This advice will be more useful later, admittedly. Glaze over it until we've 
integrated controllers.

Are you sure that your `$scope` is what you think it is? Are you trying to use 
a variable in a view that is defined in a totally different controller? Pay
attention to your `$scope`, and when in doubt, `$scope` it out. 

##3) Check your dependency injection

This advice will be more useful later; glaze over it here.

In AngularJS, whenever you're using a library or file that is external to your
controller, you have to inject that provider into the controller via dependency
injection (we'll talk about that later in the week). Just know that `UnknownProviderError`
is a dependency injection error, and you're either trying to use a library/file
that you haven't injected, or you injected it incorrectly.

#Common Errors

##When running npm tasks:

###1) Exit error 1

This is a bandwidth issue. I know that StackOverflow will try to tell you that
it's a permissions issue; however, basically any time you encounter this at Ada,
given the Ada internet, it's a bandwidth issue. Unfortunately, npm needs a decent 
chunk/speed of internet to run.

The best solution to this is to either stagger installs/downloads with your
classmates so you aren't all trying to download at the same time, or to go somewhere
with a better internet connection (your phone probably isn't good enough).

###2) Exit error 8

This error indicates that your port is in use somewhere else. Either shut down
your other server (probably an npm start task, probably either phonecat or
blahg) or change the port number.

To change the port number, open `package.json`. There should be a line under
`scripts` that looks something like `"start": "http-server -a 0.0.0.0 -p 8000"`.
That part that says `-p 8000` is telling it which port to run on. Change that
number to something else (say, 9000) and make sure that when you navigate to it
in the future, you navigate to `localhost:9000` (or whatever) instead of 
`localhost:8000`

##When loading a page
###Is your browser console open?!?!?! Do you have an error message? LOOK if 
you don't know!


###1) My browser window is empty and I don't have an error message in my browser
console

This probably indicates that the AngularJS isn't loading at all, and that your
page is loading as HTML without AngularJS. In this case, HTML would just ignore
the ui-view and not tell you about that.

To confirm this diagnosis, do the following things in `layout.html`:

i) Put a "sanity check" line of HTML inside the body, outside the `ui-view`, and
then refresh the page. This is to make sure that you are actually loading the
page you think you're loading. I like to put `sanity check` or `ellen woooooooo`
in my code; do whatever makes your heart sing here, just make sure it's inside the
`body` tags but outside the `ui-view`. If you see that text, proceed to the next
step. If not, check the URL you're navigating to--is it `http://localhost:8000/app/views/layout.html#/home`?

ii) Put `{{2 + 2}}` inside the `body` tag and outside the `ui-view` tag. If you 
see a string "{{2 + 2}}", then you aren't loading the angular app. If you see `4`,
then AngularJS is loading and you have a different problem.

To resolve this problem, check the following:

i) In `layout.html`, do you have `<html ng-app="blahgApp">`?

ii) In `js/controllers/layout.js`, do you have the line `var blahgApp = angular.module('blahgApp', [`?

iii) In `bower_components/`, do you have an `angular/` directory?

iv) In `layout.html`, do you have the line `<script src="../../bower_components/angular/angular.min.js"></script>`?

If all of these issues have been addressed, restart your server (the `npm start`
thing). Then, double-check your spelling and path specs, because this error is a 
decent indication here that your AngularJS isn't loading.


###2) I see curly brackets in my code (these: `{{ foo }}`)

This probably indicates one of two things: either we have a path error in our
browser, or our controller isn't working.

a) Check your URL in your browser. Are you navigating to `http://localhost:8000/app/views/layout.html#/home`?
If not, you probably aren't actually navigating through the routes and rendering
the pages you think you're rendering, you're probably just asking the server
for an HTML file. This file doesn't include any of your sources or logic, so it
won't work.

b) If the URL is good

i) Check your error messages. Do you have an injector error or a provider error?
Then this is probably a dependency injection issue. Take a look at the section on
dependency injection.

ii) Does the page you're rendering have a line that says `ng-controller=YOUR_CONTROLLER_NAME`?
Is the Angular code inside that div? Is there an `ng-app=FOO` on some HTML element
that is around the Angular code?

iii) Have you correctly defined your controller? Is everything spelled correctly?

iv) Is the file with the controller in it in a script tag on `layout.html`? You
should have a line that says `<script src="../js/controllers/CONTROLLER_FILE_NAME.js"></script>`? If not, you should add it.