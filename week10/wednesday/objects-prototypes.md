# Objects and Prototypes

This lesson will get you knowing about JavaScript's Object and its prototypes.


### What is an Object in JS?
* Everything!
* `var person = Object.create( null );`

### Properties on objects
```
var fruit = Object.create( null );

Object.defineProperty( fruit, 'name', {
  value: 'banana',
  writable: true,
  enumerable: true,
  configurable: true
});

person[ 'name' ]; //=> 'banana'
person.name; //=> 'banana' SHORTHAND FTW
```


### What is a Prototype in JS?
* A pointer to an Object from an Object
* Objects inherit from Objects

```
var config =  {
  value: 'banana',
  writable: true,
  enumerable: true,
  configurable: true
};


var fruit = Object.create(null);
config.value = true;
Object.defineProperty(fruit, 'hasSeed', config);
 
var banana = Object.create(fruit);
config.value = 'Tropical';
Object.defineProperty(banana, 'climate', config);
config.value = 'Musa';
Object.defineProperty(banana, 'genus', config);
 
banana.hasSeed // true
banana.climate // 'Tropical'
banana.genus   // 'Musa'
 
Object.getPrototypeOf(banana) // returns the fruit object

```

* Easier way

```
var fruit = Object.create(null);
fruit.hasSeed = true;
var banana = Object.create(fruit);
 
banana.climate = 'Tropical';
banana.genus = 'Musa';
 
banana.hasSeed // true
banana.climate // 'Tropical'
banana.genus   // 'Musa'  
```

* Even easier

`var fruit = {}; //shorthand (guitar solo)`

This is the same as:

`var fruit = Object.create( Object.prototype );`

Object prototype has a few properties on it:

```
constructor,
toString,
toLocaleString,
valueOf,
isPrototypeOf,
hasOwnProperty,
propertyIsEnumerable
```

Now, so does fruit!

* What about giving methods to banana?

`banana.prototype.color = 'yellow';`

Now, this can happen

```
var cavendish = Object.create( banana );

cavendish.color; //=> 'yellow'
```

### Constructors

* Want an easy way to access that object?

```
var Fruit = function(){
  this.hasSeed = true;
};

var Banana = function(){
    Fruit.call( this );
};

Banana.prototype = Fruit.prototype;

Banana.prototype.climate = 'Tropical';
Banana.prototype.genus = 'Musa';
Banana.prototype.color = 'yellow';

var cavendish = new Banana();

cavendish.color; //=> 'yellow;
cavendish.hasSeed; //=> true;
```

### Storing methods on prototypes and calling them

```
Banana.prototype.peel = function(){
  console.log( "Peel off" );
};

var ban = new Banana();
ban.peel(); //=> "Peel off";
```

### The dreaded `this`

* Depends on context of how it is called

```
Fruit.prototype.tell = function(){
  console.log( this.hasSeed );
};
var f = new Fruit();
f.tell(); //=> true;
f.tell.call( f ); //=> true
f.tell.call( this ); //=> undefined
```







