# Functions!

This lesson will focus on JavaScript's Functions


### Functional expressions vs. Function declarations
* Functions are objects
* `var foo = function(bar){};` vs. `function foo(bar){}`
* Evaluated while interpreting vs. Evaluated before code runs

### Functions, methods, constructor calls
* `var foo = function(){}`
* ```
  var obj = {
    foo: function(){
    }
   } ```
* `var Obj = function(){}; var Obj.prototype.foo = function(){}; var o = new Obj();`

### Calling functions
* `foo();`
* `obj.foo();`
* `o.foo();`
* `foo.call( bar, a1, a2, a3 )`
* `foo.apply( bar, [a1, a2, a3] )`


### Passing functions as variables (higher order functions)
```
var foo = function( bar ){
  console.log( bar );
};

var doMath = function( num1, num2, fn ){
  var sum = num1 + num2;
  fn( sum );
};
```
* Example: Array.prototype.sort

```
var comparison = function(x, y){
  if( x < y ){
    return -1;
  }
  if( x > y ){
    return 1;
  }
};

[4, 2, 5, 1, 9, 5].sort( comparison ); //=> [1,2,4,5,5,9];
```

### Call vs. Apply
* fn(); => fn.call( this );
* `fn( 1, 2, 3 )` => `fn.call( this, 1, 2, 3 )` => `fn.apply( this, [1,2,3] );`
*

### Arguments!
* A pseudo-array of the arguments that are passed into a function

```
var hello = function(name){
  var args = Array.prototype.slice.call( arguments, 1 );
  console.log( "Hello " + name + ", " + args.join( ' ' ) );
};

hello( "jeff", "what", "are", "you", "doing" ); //=> "Hello jeff, what are you doing"
```


