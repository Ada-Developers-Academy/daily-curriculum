# JavaScipt 104: Objects & Inheritance.

Looking back on last week's project utilizing the This Is My Jam API, I saw many functions that looked like this:

```javascript
function youtube_embed(data) {
  var iframe = $('<iframe></iframe>');
  //... do some work
  return iframe
}

function vimeo_embed(data) {
  var iframe = $('<iframe></iframe>');
  //... do some slightly different work
  return iframe
}
```

This works well enough, but it's clear that we'll end up with a lot of standlaone functions that do very similar work. If we were creating similar functionality in Ruby, we would likely write a class that would allow us to DRY up the repeated code into something manageable and reusable.

But this is JavaScript and things are a little bit different. It might not be as pretty as Ruby, but we can acheive similar DRY, reusable code by using object prototypes.

In a _prototypal system_, objects inherit from objects. In Ruby, we know that seeing `class Alpha < Beta`, means that `Alpha` is defined with having all of the methods, accessors, properties, and constants that exist on `Beta`.

JavaScript doesn't have an inheritance operator or keyword like Ruby's `<`. Instead, it has a `new` keyword such that `new Alpha()` produces an object that inherits from `Alpha.prototype`. So where's `Beta` in that setup? How would we create `Alpha` such that it inherits from `Beta`?

## Approach #1: Using Object Prototypes
Let's copypasta this code block into our Node REPL:

```javascript
var Beta = {
  how_many_dogs: 7,
  dog: function() { console.log('woof!'); },
  cat: function() { console.log('mrow!'); }
}

function Alpha() {
  this.bird = function() { console.log('chirp!'); }
};

Alpha.prototype = Beta;

var alpha_instance = new Alpha();
```
#### What did we just do?
`Beta` is a generic JavaScript object. `Alpha` is a function that sets a property on itself (`this.bird`). We then assign `Alpha`'s prototype to be `Beta`. By assigning the prototype, we are telling JavaScript that new _instances_ of the `Alpha` object should inherit the properties and functions defined on `Beta`.

Ok. So now what? Well, let's take a look at what we can do with `alpha_instance`:

```javascript
alpha_instance.bird(); // alpha_instance -> Alpha
alpha_instance.dog(); // alpha_instance -> Alpha -> alpha_instance.prototype -> dog()
alpha_instance.cat(); // alpha_instance -> Alpha -> alpha_instance.prototype -> cat()
alpha_instance.how_many_dogs; // alpha_instance -> alpha_instance.prototype -> how_many_dogs
```

#### So how did we instantiate `Alpha`?

The `new` keyword is responsible for creating the instance. Notice that we invoked the function too! The whole line is `new Alpha()`. Invoking the function triggers the function body of `Alpha`, essentially using the function body as the constructor for the object.

So `alpha_instance` has a `bird()` function that it got as part of the invocation of `Alpha()`. The function body of `Alpha()` is the constructor for new instances.

#### What can we do with this?

We can build complex functions that look and act like objects we'd use in Ruby. For an example let's take a look at the [code in this file](https://github.com/jnf/jquery-jukebox/blob/jnf/with-views/app/assets/javascripts/embed_formatter.js). In this example, I used `prototype` to add new functions to a `Formatter()` object. Rather than assigning a generic object to `Formatter.prototype`, I added a series of named functions to it. Consuming this object looks like this:

```javascript
var data = {
  artist: "Defeater"
  title: "Spared in Hell"
  url: "http://soundcloud.com/epitaph-records/defeater-spared-in-hell-1"
  via: "soundcloud"
}; // this is the return data from the ajax api request

var formatter  = new Formatter(data);
var embed_code = formatter.build();
```

## A note about using `Object.create()`

Introduced in ES5, `Object.create()` is a function that creates new objects. It takes one or two paramters. The first is an object that will be the new object's prototype. The second parameter is an optional object. If the second parameter is provided, it's properties and functions will be applied to the newly created object. You can read more about using `Object.create()` [over at MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create).

There are a couple of gotchas and (to me, at least) unintuitive behaviors with using `Object.create()`, so be sure to read the docs carefully when you try using it.

## A note about the new `class` keyword in ES6.

When reading about JavaScript, you'll come across folks excited about ES6 adding some new keywords like `class`, `extends`, `constructor`, and `super`. These keywords will allow us to build objects and inheritances that feel more familiar to us. However, JavaScript will remain a prototypal language; these keywords are just syntactic sugar sprinkled on top of what we are doing here with `prototype`.


http://javascript.crockford.com/prototypal.html
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
