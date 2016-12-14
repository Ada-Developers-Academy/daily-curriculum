# Scope

## Local Variables
In Ruby, we are used to **block-level scope**. In Ruby, when control enters a block, such as the if statement, new variables can be declared within that scope, without affecting the outer scope. _This is not the case in JavaScript._

#### Ex 1
```javascript
var name = "Ada";

function showName() {
	// Local variables have precedence over globals in functions.
  var name = "Rosa";
  console.log(name);
}

showName();         // => "Rosa"
console.log(name);  // => "Ada"
```

#### Ex 2
```javascript
var x = 1;
console.log(x); // => 1
if (true) {
	var x = 2;
	console.log(x); // => 2
}
console.log(x); // => 2
```

What is the difference between the scope with the first example and the scope with the second example?

## Global Variables
All variables declared outside a function are in the global scope. In the browser, which is what we are concerned with as front-end developers, the global context or scope is the **window object** (or the entire HTML document).

Sometimes variables are in the global scope, even if you expect them to not be.
One of the most unexpected examples, is a loop starter variable:
#### Ex 3
```javascript
for (var i = 1; i <= 10; i++) {
  console.log(i); // outputs 1, 2, 3, 4, 5, 6, 7, 8, 9, 10;​
};
​
​// The variable i is a global variable and it is accessible in the
// following function with the last value it was assigned above ​
​function aNumber () {
  console.log(i);
}
​
​// The variable i in the aNumber function below is the global variable i that was changed in the for loop above.
// Its last value was 11, set just before the for loop exited
aNumber ();  // => 11​
```

This is because JavaScript has **function-level scope**. Blocks, such as if statements, do not create a new scope. Only functions create a new scope.

In JavaScript, functions are our _de facto_ scope delimiters for declaring vars, which means that usual blocks from loops and conditionals (such as if, for, while, switch and try) **DON'T** delimit scope, unlike most other languages. Therefore, those blocks will share the same scope as the function which contains them. This way, it might be dangerous to declare vars inside blocks as it would seem the var belongs to that block only.

## Variable Hoisting
[Scope & Hositing Explained](http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/)

[More Scoping and Hoisting](http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html)
