# Playing With jQuery

jQuery is a JavaScript library for DOM (web page) manipulation and
cross-browser script compatibility. jQuery does most of it's magic
through a global function that it defines in the '$' variable.

## Selectors

You can use the jQuery function ($) to grab and manipulate elements of
your web page. jQuery uses CSS selectors to find the elements on the
page.

```javascript
$("body");     // returns the body element
$(".content"); // returns an array of elements with the "content" class
$("#someId");  // returns the element with id == "someId"
```

## Functions that take functions

Many jQuery methods take functions as parameters. These are often
referred to as "callbacks."

```javascript
$("#someId").click(function () { // this is an "anonymous function"
                                 // we define it here and pass it to the
                                 // .click() function. When a click happens,
                                 // this function is called.
  /* Do something here! */
});
```

The jQuery click() function, waits for a user event--in this case the
user clicking the element with their mouse--and then calls the
function that you provide (the callback) when that event happens.

## jQuery Documentation

The many splendors of jQuery are explained in great detail here:

[http://api.jquery.com/](http://api.jquery.com/)

The following functions are of practical value. Look 'em up!

* .append()
* .prepend()
* .css()
* .html()
* .click()
* .submit()

## Simple DOM Manipulation

Here's [a simple example](http://jsfiddle.net/wstfe20a/) on JSFiddle.

Play with the example:

* Change the document structure
* Change the CSS
* Change the click behavior

There is also a local HTML file with similar document structure that
pulls in jQuery via a script tag. Try opening the document in your
browser and doing the same manipulations in the JavaScript console.
