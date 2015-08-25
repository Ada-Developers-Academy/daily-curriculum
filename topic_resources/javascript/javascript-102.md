# Fun with Functions!
Javascript's appeal and power and flexibility are in the myriad ways we can interact with functions.

### Functional expressions vs. Function declarations
* Functions are objects
* `var foo = function(bar){};` vs. `function foo(bar){}`
* In _many_ cases, the differences here are nominal, but it's important to understand the first example is an __expression__ while the second is a __decleration__.
* [This StackOverflow answer is one of the best I've seen in describing the difference and when it matters](http://stackoverflow.com/questions/3887408/javascript-function-declaration-and-evaluation-order).

### Functions, methods, constructor calls
```javascript
var foo = function() { console.log('nah'); }
var obj = {
  foo: function() {
    console.log('foo!');
  }
}
var Obj = function(){};
Obj.prototype.foo = function(){};
var o = new Obj();
```

### Calling functions directly
* `foo();`
* `obj.foo();`
* `o.foo();`

### Passing functions as variables
* Computer scientists call this _higher order functions_ and/or _first-class functions_.

```
var talker = function( sum ){
  console.log( "Yo the sum is: " + sum );
};

var alerter = function(sum) {
  alert("Yo the sum is: " + sum);
}

var doMath = function( num1, num2, im_a_function ){
  var sum = num1 + num2;
  im_a_function( sum ); //Hey! let's execute the function we were given!
};

doMath(1000, 2, talker); //Hey! talker is a function!
doMath(1000, 2, alerter); //Hey! alerter is a function!
```

#### Somewhat Practical Example: Array.prototype.sort

```javascript
var backwards = function(x, y){
  if( x > y ){
    return -1;
  }
  if( x < y ){
    return 1;
  }
};

[4, 2, 5, 1, 9, 5].sort(); //=> [1, 2, 4, 5, 5, 9]
[4, 2, 5, 1, 9, 5].sort( backwards ); //=> [9, 5, 5, 4, 2, 1];
```

### Call vs. Apply
* `foo.apply( bar, [a1, a2, a3] )`
* `foo.call( bar, a1, a2, a3 )`
* The difference is that `apply` lets you invoke the function with __arguments as an array__; `call` requires the parameters be __listed explicitly__.
* The real power in `apply` and `call` is in the `bar` variable in the above examples. We will discuss it in detail in the next couple of lessons.

```javascript
function lunch_alert(name, food) {
    alert("My name is " + name + " and I am hungry for " + food + ".");
}
lunch_alert("Jeremy", "tacos");
lunch_alert.apply(undefined, ["Rosa", "tacos as well"]);
lunch_alert.call(undefined, "Raquel", "world domination");
```


### Arguments!
* A pseudo-array of the arguments that are passed into a function

```javascript
var hello = function(name){
  var args = Array.prototype.slice.call( arguments, 1 );
  console.log( "Hello " + name + ", " + args.join( ' ' ) );
};

hello( "Jeremy", "what", "are", "you", "doing" ); //=> "Hello Jeremy, what are you doing"
```


