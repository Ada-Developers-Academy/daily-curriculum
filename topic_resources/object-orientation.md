# Object Orientation: Methods, Classes, and Instances

## Methods
We have seen and used methods before, but we haven't created our own method definitions yet.  

### Creating methods

Creating a __method definition__ is the process of defining a method header and contents in order to create a re-usable block of code. 

```ruby
def say_hello
  puts "hello world!"
end
```

In this example, ```say_hello``` is the method name. The purpose of this method is to print out a string to the user. As we learned earlier, we want to __call__ a method in order to execute the functionality.

```ruby
say_hello
# => hello world!
```

### Method parameters

Once we have created a method, we may want to use a __parameter__ to tell the object how to 'do' the method. Think back to our ```Math.sqrt(9)``` example.

To add a parameter to the ```say_hello``` method, we would change the __method definition__ to:

```ruby
def say_hello(name)
  puts "welcome #{name}! hello world!"
end

say_hello("kari")
# => welcome kari! hello world!
```  

In this updated method,```name``` is a variable that contains the value for the parameter passed in. When we called the method, the ```name``` variable was set equal to the string ```"kari"``` since that was the value we passed in.  


## Objects Overview
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

### initialize

Let's start over building our class, but let's build it to be a little customizable.
We want the attributes (color & name) to be able to be set by dynamically.


```ruby
class Chair

  def initialize

  end

end
```

That `initialize` method (called a constructor) is called from within the `new` method. So we will use it to "construct" our object.
We can pass in values to the new method, they are then passed along to `initialize`, where we can use them to assign variables within the instance of the object

```ruby
class Chair

  def initialize(name, color)
    @name = name
    @color = color
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def color
    @color
  end

  def color=(new_color)
    @color = new_color
  end

end
```

### attr!

The code above allows us to read/get and write/set the color and name properties in the Chair class. This is done so frequently that there is a much faster way for us to do this! Using these attributes our class is much more simplified:

```ruby
class Chair
  attr_reader :name, :color
  attr_writer :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
```

These two attributes, ```attr_reader``` and ```attr_writer``` allow you to control the reading a writing of these particular properties.

### attr_accessor

If you don't need to be able to control the read/get and write/set functionality independently from one another, you can just use ```attr_accessor``` which covers both! Using this attribute our class code is __even more__ simple:

```ruby
class Chair
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

end
```
