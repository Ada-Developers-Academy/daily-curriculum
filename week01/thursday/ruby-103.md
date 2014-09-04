# Ruby 103
## Literals & Blocks

### Literals

Literals are special syntax to create objects, they do a lot of the magic that makes Ruby very readable.  There are quite a few types of Literals but we're going to focus on the most common just to get the idea across.

First, lets to over a basic Ruby idea, objects are initialized by class, so a common approach to making a new object is to use the `.new` method on a class.

```
String.new # => ""
```

But, that isn't how we've seen a string created up until now, we've simply just written `""`, and those two quotes are literals.

Behind the scene Ruby is indeed initializing a `String` object from the `String` class, just as we would in the above example. But it would be obnoxious and ugly if we had to type `String.new` everytime we wanted to use a string.

```
String.new # => ""
"" # => String
'' # => raw String, this is a string that doesn't allow substitutions like ruby interpolation

Array.new
[]

Hash.new
{}

:word

123
123_456
```

There are a many more literals, but not seen as commonly, for a complete list see the [guide](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals)

### Blocks
Blocks are segmented chunks of code, blocks are kind of like methods, but they don't have a name and are not part of a parent class. For example:

```ruby
[1,2,3,4].each do |number|
  number * 100
end
```

`number * 100` is a chunk of code, similar to what would be in a method, but in this case we don't need to go through all the trouble of creating a method just to iterate over some numbers.

Block can be identified by either `do ... end` or `{ }`. The curly brackets can be confusing because these are the same characters for a `Hash`

```ruby
[1,2,3,4].each { |n| n * 100 } # This is a block

{foo: :bar} # This is a Hash
```

So how do you tell them apart, mostly the contents blocks will have code in them, while Hash's will always have the key/value pairs.

Block arguments are defined using `|` characters:

```
[1,2,3].each do |n|
  puts n
end
```

`n` is the defined argument, this means that objects given to the block are going to be assigned to the `n` variable within the scope of the block

Another potential gotcha is if you try to give a Hash as an argument to a method using a space, Ruby will think you are passing it a `Hash`

```ruby
def some_method_that_takes_a_hash(hash)
  hash
end

some_method_that_takes_a_hash {foo: :bar} # => syntax error

```
