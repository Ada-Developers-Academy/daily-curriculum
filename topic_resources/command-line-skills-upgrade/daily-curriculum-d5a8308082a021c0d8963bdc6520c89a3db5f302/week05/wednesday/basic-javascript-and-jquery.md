# Basic JavaScript and jQuery

## First Things, First

**JavaScript has no relationship with Java**

The naming is an unfortunate side-effect of a bad marketing idea. So,
to repeat:

**JavaScript has no relationship with Java**

## Separating Concerns

We try to separate concerns in web applications:

* HTML - Document structure and information. Your HTML mark up should
  be a semantic represenation of the information in your document.

* CSS - Presentation. CSS controls the way that we present our
  information to the user.

* JavaScript - Behavior and interactivity. We use JavaScript to handle
  user interactions via events, and to add interactivity to our web
  apps.

## JavaScript basics

### Playing with JavaScript

Safai, Firefox, and Chrome all support a JavaScript console, which
allows us to write JavaScript directly in the browser. In Chrome, you
can access the console either via the menu (View > Developer >
JavaScript Console), or via the keyboard shortcut (Command - Option - J).

There are also several sites that allow you to live code JavaScript,
HTML, and CSS. The three most popular are [JSFiddle](//jsfiddle.net),
[CodePen](//codepen.io), and [JS Bin](//jsbin.com). I'll be using
JSFiddle for demonstrations, but it's a matter of taste.

### Getting Help

The best JS doumentation is on the
[Mozilla Developer Network](https://developer.mozilla.org). ProTip:
add "mdn" to your Google searches about JavaScript
questions. W3Schools results will show up above MDN otherwise, and
their documentation is bad.

### Variables

Declare all variables with the var operator!

```javascript
var five = 5;
```

If you omit ```var``` you will get a global variable, which can lead
to all sorts of problems. JUST DON'T DO IT!

### Types

JavaScript supports similar basic types to Ruby: Boolean, Null,
Undefined, Number, String, Array, Object, and Function.

Open the JavaScript Console and try the followin examples.

* Boolean is true or false

```javascript
var t = true;
var f = false;
```

* Null is the value null. This represents an "empty" value.

```javascript
var empty = null; // this is false in an if statement
```

* Undefined is the value undefined. When a variable which has not
  declared is accessed, JS returns undefined.

```javascript
if (blahblah) {  // blahblah has not been declared it returns undefined
                 // which is false-y
    // so, this won't happen
}
```

* Number is a numeric value including integers (1, 2, 3, etc.), floats
  (1.4, -40.1), infinity (+Infinity, -Infinity), and NaN which means
  "not a number." NaN is returned when you do a numeric operation on
  anything that's not a Number. 

```javascript
var four = 4,
    two = 2.0;

Infinity < Number.MAX_VALUE  // false
Infinity > Number.MAX_VALUE  // true

two == four / two; // true

// All JS numbers are floats, and floats are not 100% accurate...
0.1 + 0.2 == 0.3; // false!
0.1 + 0.2;

"asdf" - 5; // NaN
```

* Strings a declared with "" or ''. They're basically the
  same. Pick one and stick with it!

```javascript
var str = "This is a string";
str.length;      // 16 - access the length property
str.substr(2,5); // "is is" - call the substr function
```

* Arrays are similar to Ruby arrays. They are declared and accessed
  with square brackets ([]).

```javascript
var arr = [1, 2, 3, 4];
arr.length;  // 4 - access the length property
arr[0];      // 1
arr.pop()    // 4 - call the pop() function
arr;         // [1, 2, 3]
```

* Objects are like simple Ruby hashes. They are declared with braces
  ({}). You can access properties in an Object with bracket notation
  (like an array) or dot notation.

```javascript
var obj = {     // We can span lines; whitespace is mostly ignored.
  num: 5,
  str: "This is a string",
  subObject: {
    otherNum: 4
  }
};

obj.num;    // 5
obj['num']; // 5; note we use a string!
obj.subObject.otherNum; // 4
obj.foo;    // undefined

```

* Functions in JavaScript are awesome. They are more "pure" than Ruby
  methods and can be put in variables, and passed around like any
  other type. Understanding functions is the key to JavaScript
  enlightenment.

```javascript
var adder = function (a, b) {
    return a + b;   // You need to explicitly call return in JavaScript
}

// You need to use parens to call your function!
adder;        // this returns the function that you just declared
adder(1, 2);  // 3
```

