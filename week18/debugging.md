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