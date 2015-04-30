# Ruby 103: Literals, Iterators & Blocks

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

## Iterators & Blocks

_Iteration_ is the process of progromatically interacting with a collection of values, one at a time. We call it "looping" sometimes, and we do a lot of it. Here is a simple loop; fire up irb and give it a try:

```ruby
10.times { |n| puts n } # So... what happened
```
#### Question: What is `times`?

We can iterate all kinds of things, but probably the most common and most fun is iterating an _Array_. They're especially suited for iteration because they, by default, have a objective order to their elements. Here's an example of iterating an _Array_ using the `each` _method_:

```ruby
[10, 20, 30, 40, 50].each do |number|
  puts number * 10
end
```
Cool, right? `each` iterated the _Array_, starting with the first value, multiplied the value by 10, and spit it out. It knew what to do on each step of the iteration because we provided a _block_ of instructions.

### Let's talk about Blocks...

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
[1,2,3].each do |number|
  puts number # wheeeee! Right down the slide!
end
```

`number` is the defined argument, this means that objects given to the block are going to be assigned to the `number` variable within the scope of the block.

### Exercise: Walk Through a Loop:

It's very important to understand what's happening during iteration. The best way to get comfortable with loops is to make a chart showing how values change during iteration. Here's an example of a loop and it's corresponding value chart:

```ruby
[11,5,8,100].each do |n|
  puts number * 4
end
```

| loop count | value of n | output |
|------------|------------|---------
| 1          | 11         | 4
| 2          | 5          | 20
| 3          | 8          | 32
| 4          | 100        | 400


With a pair, figure out what's happening on each iteration of the following loop, on paper, using the handy table template:

| loop count | value of x | value of y | output |
|------------|------------|------------|---------
| | | |
| | | |

You'll need more rows, but you get the idea.

```ruby
y = 0
[9,8,7,6,5,4,3,2,1].each do |x|
  if x % 2 == 0
    y = y + x
    puts y
  else
    puts x
  end
end
```
