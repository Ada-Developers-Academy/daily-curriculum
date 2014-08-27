# Object Orientation: Classes, Instances, and Methods

## Overview
An object is the representation of an idea within a program.
Let's look at the common objects we already know.

```
String.new
# => ""

Hash.new
# => {}

Array.new
# => []
```

Where we would normally just use `""`, we can also call the `.new` method on the string class.
A class can be identified by it's capitialized first letter. So `""`, `[]`, and `{}` are really just magic
ways of initiating a new instance of a certain type of object. Most classes do **NOT** have this kind of
convenience.

### Creating a custom class

Although any abstract idea can be represented as an object, it's sometimes easy to think of a physical object to get the idea. Think about you as a human being. You have attributes like height, weight, and eye color. You have methods like "walk", "run", "talk", and "walk backwards." Different kinds of objects have different attributes and methods.

Think of the idea of a chair, not a specific chair, just the idea of a chair. What color is it? None! The idea of a chair doesn't have a color. Only an actual chair has a color.

Let's create a class for a Chair in ruby.

```ruby
class Chair
  def name
    "Vilgot"
  end  

  def weight_in_lbs
    29
  end

  def type
    "Swivel"
  end

  def color
    "Black"
  end

  def max_height
    23.625
  end
end
```

I'm going to load this script into `irb` using the `-r` flag

```bash
irb -r ./chair.rb
```

```ruby
Chair # => Chair - This is the class, it's just the idea of a chair
Chair.color # => Error!
Chair.new # => #<Chair:0x007fb7da550ca0> - this is an instance of a chair, it has a color
Chair.new.color # => "Black"
```

+ Chair (Class)
+ Chair.new (returns an instance of the `Chair` class)
+ Chair.new.name => "Vilgot" (an instance of the class `String`)
+ Chair.new.weight_in_lbs => 29 (an instance of the class `Integer`)

## Everything is an object (almost)
In the last section, we said *everything is an object*. This is a confusing concept at first, but let's go over a couple of examples to highlight that point.

Every object has a class, try:

```ruby
"Hello".class # => String
{}.class # => Hash
Chair.new.class # => Chair
```
Even classes have classes! Try `"hello".class.class`!

Commonly-used classes have pre-defined methods baked in - that's how Ruby works from the inside out. To see what methods are available on any object, just call `.methods`. Try it with `"hello".methods`.

Just to go further down the rabbit hole, the response of `"hello.methods"` is even an object, so you can call `.class` on it. Turns out that it is an Array.

We can use Array's predefined methods on `"hello".methods`, like `.count`. `"hello".methods.count` will give us the number of methods you can call on any string. How many are there?

## Lesson

Build the Dungeon Text Adventure game outlined on page 149-158 in Beginning Ruby

## Optional Lesson: More About Methods
Can't get enough methods? Check out Chapter 6 of Learn to Program. It'll go over some common (and not-so-common) methods for some of our favorite types of objects: integers and strings.
