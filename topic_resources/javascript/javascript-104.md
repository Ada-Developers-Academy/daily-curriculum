# JavaScipt 104: Objects & Inheritance.

Looking back on the world clock project, I saw many functions that looked like this:

```javascript
function displayTime(){
  var currentTime = new Date();

  var clockDiv = document.getElementById("clock");

  var hours = currentTime.getHours();
  var meridiem = (hours > 12) ? "PM" : "AM";

  hours = formatNonMilitary(hours);
  hours = formatDigit(hours);

  var minutes = formatDigit(currentTime.getMinutes());
  var seconds = formatDigit(currentTime.getSeconds());

  var time = hours + ":" + minutes + ":" + seconds + " " + meridiem;

  clockDiv.innerText = time;
}
```

This works well enough, but it's clear that we'll end up with a lot of standlaone functions that do very similar work. Moreso, there's a lot going on in this code; how would we go about writing tests for it? If we were creating similar functionality in Ruby, we would likely write a class that would allow us to DRY up the repeated code into something manageable and reusable.

But this is JavaScript and things are a little bit different. It might not be as pretty as Ruby, but we can acheive similar DRY, reusable code by using _object prototypes_.

In Ruby, we know that seeing `class MyPets < FuzzyPets`, means that `MyPets` is defined with having all of the methods, accessors, properties, and constants that exist on `FuzzyPets`. We would say that _MyPets inherits FuzzyPets_.

JavaScript doesn't have an inheritance operator or keyword like Ruby's `<`. Instead, it has a `new` keyword such that `new MyPets()` produces an object that inherits from `MyPets.prototype`. So where's `FuzzyPets` in that setup? How would we create `MyPets` such that it inherits from `FuzzyPets`?

## Ineritance Using Object Prototypes
Let's copypasta this code block into our Node REPL:

```javascript
var FuzzyPets = {
  nap_hours: 7,
  dog: function() { console.log('woof!'); },
  cat: function() { console.log('mrow!'); }
}

function MyPets() {
  this.bird = function() { console.log('chirp!'); }
};

MyPets.prototype = FuzzyPets;

var my_pets_instance = new MyPets();
```
#### What did we just do?
`FuzzyPets` is a generic JavaScript object. `MyPets` is a function (which is also an object) that sets a property on itself (`this.bird`). We then assign `MyPets`'s prototype to be `FuzzyPets`. By assigning the prototype, we are telling JavaScript that new _instances_ of the `MyPets` object should inherit the properties and functions defined on `FuzzyPets`.

Ok. So now what? Well, let's take a look at what we can do with `my_pets_instance`:

```javascript
my_pets_instance.bird(); // my_pets_instance -> MyPets
my_pets_instance.dog(); // my_pets_instance -> MyPets -> my_pets_instance.prototype -> dog()
my_pets_instance.cat(); // my_pets_instance -> MyPets -> my_pets_instance.prototype -> cat()
my_pets_instance.nap_hours; // my_pets_instance -> my_pets_instance.prototype -> nap_hours
```

#### So how did we instantiate `MyPets`?

The `new` keyword is responsible for creating the instance. Notice that we invoked the function too! The whole line is `new MyPets()`. Invoking the function triggers the function body of `MyPets`, essentially using the function body as the constructor/initializer for the object.

So `my_pets_instance` has a `bird()` function that it got as part of the invocation of `MyPets()`. The function body of `MyPets()` is the constructor for new instances.

#### What can we do with this?

We can build complex functions that look and act like objects we'd use in Ruby. For an example let's take a look at the [code in this file](https://github.com/jnf/js-digital-clock/blob/jnf/oo-solution/clock.js). In this example, I used `prototype` to add new functions to a `Clock()` object. Using this object, I can _instantiate_ as many clocks as I need. Consuming this object looks like this:

```javascript
// gonna make a clock for each <div class="clock"> in my markup
var clock_nodes = document.getElementsByClassName('clock');
Array.prototype.forEach.call(clock_nodes, function(node, index) {
  new Clock(node, node.dataset.timezone).start(); //<-- make and start a clock!
}) //hey! ask me about that `call` function. 
```

## A note about using `Object.create()`

Introduced in ES5, `Object.create()` is a function that creates new objects. It takes one or two paramters. The first is an object that will be the new object's prototype. The second parameter is an optional object. If the second parameter is provided, it's properties and functions will be applied to the newly created object. You can read more about using `Object.create()` [over at MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create).

There are a couple of gotchas and (to me, at least) unintuitive behaviors with using `Object.create()`, so be sure to read the docs carefully when you try using it.

## A note about the new `class` keyword in ES6.

When reading about JavaScript, you'll come across folks excited about ES6 adding some new keywords like `class`, `extends`, `constructor`, and `super`. These keywords will allow us to build objects and inheritances that feel more familiar to us. However, JavaScript will remain a prototypal language; these keywords are just syntactic sugar sprinkled on top of what we are doing here with `prototype`.

### READ MOAR
- [Prototypal Inheritance in JavaScript](http://javascript.crockford.com/prototypal.html)
- [MDN Docs on JS Prototypes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
