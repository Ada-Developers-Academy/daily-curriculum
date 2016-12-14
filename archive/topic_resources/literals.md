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

### More Literals!

```ruby
# bignum and floats
123_456_789
123_456.789
2.2e-5

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
