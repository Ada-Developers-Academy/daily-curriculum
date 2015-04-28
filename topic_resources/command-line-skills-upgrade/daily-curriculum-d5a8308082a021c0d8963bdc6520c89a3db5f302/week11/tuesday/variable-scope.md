# Variable Scope

This lesson will focus on JavaScript's super fun functional scoping


### BOOOO GLOBALS
* Globals crowd up the namespace
* Mess with libraries
* Are difficult to track

### Using var vs. not
* `var a = "hi";` => context of the current function
* `a = "hi";` => GLOBAL

### Scope of variables in functions
```
var fn = function(){
  var a = "a"";
  
  var fn2 = function(){
    var b = "b";
    
    console.log( a ); //=> "a"
    console.log( b ); //=> "b"
  };
  
  console.log( b ); ==> undefined
};
```

### Hoisting
```
var fn = function(){
  var foo = "foo";
  console.log( foo );
  console.log( bar );
};

fn();
// => ReferenceError: bar is not defined
// => "foo"

```

```
var fn = function(){
  var foo = "foo";
  console.log( foo );
  console.log( bar );
  var bar = "bar";
};

fn();
// => "foo"
// => undefined

```

HUH?

```
var fn = function(){
  var foo = "foo";
  console.log( foo );
  console.log( bar );
  var bar = "bar";
};
```

is the same as

```
var fn = function(){
  var foo = "foo";
  var bar;
  console.log( foo );
  console.log( bar );
  bar = "bar";
};
```

### IIFEs
* Immediately-invoked function expressions
* Best used to keep scope

```
(function(window){
  var x = "hi";
}(this));

(function(window){
  var y = "why";
}(this));

```
* Make sure to wrap files in these to keep variables from bleeding.

