# Ruby 103: Literals, Iterators, & Blocks

## Literals

Literals are special syntax to create _objects_, they do a lot of the magic that makes Ruby very readable.  There are quite a few types of Literals but we're going to focus on the most common just to get the idea across.

First, lets go over a basic Ruby idea, _objects_ are initialized by _class_, so a common approach to making a new object is to use the `.new` method on a class.

```ruby
String.new # => ""
```

But, that isn't how we've seen a string created up until now, we've simply just written `"tacos"`, and those two quotes are _literals_.

Behind the scene Ruby is indeed initializing a `String` _object_ from the `String` _class_, just as we would in the above example. But it would be obnoxious and ugly if we had to type `String.new` everytime we wanted to use a string.

```ruby
String.new # => ""
"" # => String
'' # => raw String, this is a string that doesn't care about interpolation

Array.new
[]

Hash.new
{}

:word

123
```

There are a many more literals, but not seen as commonly, for a complete list see the [guide](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals)

### Group Exercise: Divide & Conquor Ruby Literals (6 x 4)

Each group will choose a literal-ish expression from the following list. Research, explore, and try (in irb) the literal. You'll then present what you've learned about the syntax to the other groups. Try to figure out how they work, when we'll need them, and what kind of problem they might be appropriate for.

```ruby
# bignum and floats
123_456_789
123_456.789

# string backslash notation
"tacos\nare\nawesome"
"tacos\tare\tawesome"

# string % notation
%w(tacos are awesome)

x = "awesome"
%W(tacos are #{x})

%x{say tacos are awesome}
`say tacos are awesome`

# here documents
are_tacos_awesome = <<YES

I mean, how can we even be having this conversation? We're friends and all,
but if we can't get on the same taco page, I might have to rethink our plans
to go snorkling next week. Snorkling plus tacos 4eva, amirite?

YES

puts are_tacos_awesome

# ranges
0..12
0...12
12..0 # tricky!
```

## Iterators

## Ruby Blocks

Blocks (also referred to as _closures_, especially in other languages like JavaScript) are not a unique features of Ruby, but they're one that many people talk about (and more people use without realizing it!) What is a block?

>A section of code which is grouped together.

Zzzzz....

A block is a piece of code that is not executed immediately, but is stored in a variable or passed to a method, and is potentially executed at a later moment in time.

Sound complicated? Let's look at some Ruby.

```ruby
[1,2,3,4].each do |number|
  puts number * 100 # <= this is a block. :)
end

[1,2,3,4].each { |number
  puts number * 100 # <= this is a block too! :D
}
```

`number * 100` is a chunk of code, similar to what would be in a method, but in this case we don't need to go through all the trouble of creating a method just to iterate over some numbers.

Block can be identified by either `do ... end` or `{ }`.

Block arguments are defined using a pair of `|` (pipe) characters. They look like a slide, so I like to say that we slide arguments into the block. For example:

```
[1,2,3].each do |n|
  puts n # wheeeee! Right down the slide!
end
```

`n` is the defined argument, this means that objects given to the block are going to be assigned to the `n` variable within the scope of the block.

### Lambdas and Stabby Lambdas: Doing Things Later

Lambdas are blocks that are stored in a variable to be executed later. They work a lot like methods, and deciding to use a method or a lambda is often an architectural decision. Let's say we want to add some number, our code might look like:

```ruby
4+5 # => 9
```

Pretty simple. Now let's try it with variables:

```ruby
a = 4 # => 4
b = 5 # => 5
a + b # => 9
```

Now, what if we wanted to store the behavior of `a + b`? Well, we could write a method:

```ruby
def add(a,b)
  a + b
end

add(4,5) # => 9
```

And that's ok, but here's an easier way:

```ruby
add = lambda { |a, b| return a + b }
add.call(4,5) # => 9
```

What's going on here? The variable `add` was assigned a _lambda_ block that accepts two _arguments_, and returns their sum. The `.call` _method_ invokes the lambda, executing it with the arguments we provided (4 and 5).

#### Question: What would be the result of `add.call(1000,10_000)`?

Ok, so _lambda_ is really hard to type. Seriously, I've messed it up so many times while working on this lecture. Fortunately, lots of other Rubyists agree, so now we have something called the __stabby lambda__:

```ruby
add = -> { |a, b| return a + b } # the -> is a stabby lambda
```

They work exactly the same and are becoming increasingly common.

## Why do we need blocks and lambdas, stabby or otherwise?

Would you believe you've already been using them without knowing it? Take this bit of Ruby:

```ruby
[1,2,3].select { |n| return n.odd? }
```

In the above example, `{ |n| n.odd? }` is a block! We're passing it in to `.select` (a _method_ from the _Enumerable_ class) which iterates over each element in the _Array_ and uses the block to determine what to return; it only returns the values that are evaluated `true` in the block.

Here's another use of a block:

```ruby
[1,2,3].each do |n|
  puts n * 2
end
```

`n` is the defined argument, this means that objects given to the block are going to be assigned to the `n` variable within the scope of the block

#### Iteration

Basic Iterators
===============
An iterator does a piece of work over and over and over and over and over...
```
10.times
   puts "Hello World!"
 end
 ```

Ranges
======

```ruby
(1..10).each { |number| puts number }
('a'..'z').each { |letter| puts letter }
```

What would this do?

```ruby
first = 10
last = 20
(first..last).each { |number| puts number }
```

The most powerful use for any Ruby collection is iteration. The most basic iteration method that
exists for any collection object is `#each`.

```ruby
["Ice Cream", "Chocolate", "Smores"].each do |food|
  puts "I love #{food}"
end

# I love Ice Cream
# I love Chocolate
# I love Smores
# => ["Ice Cream", "Chocolate", "Smores"]
```

The each method takes a block as an argument, blocks can be represented in a couple different
ways, but the `do` `end` style is the most simple. We'll learn more about blocks in the future.
For each Object in the array, the code inside of the block will be executed, during execution
the variable `food` will point to the current object.
=======
Different format, same output.

### Question: Why would I use `{}` versus `do/end`?

Last example, putting it all together:

```ruby

```
