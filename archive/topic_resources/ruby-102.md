# Ruby 102
### More of the basics
We're going to review some of the basic and most used Object types within Ruby.

`String`
------
Ruby strings are a sequence (or array) or characters, if this sentence were evaluated
by ruby it would be a `String`

```ruby
"Hello World"
# => "Hello World"

"Kit" + "tens" + "!"
# => "Kittens!"

"-" * 40
# => "----------------------------------------"

"Kari".reverse
# => "iraK"

"I'm thirty one characters long!".length
# => 31
```

Check out the [Documentation for String](http://www.ruby-doc.org/core-2.2.3/String.html) to see other things that you can do to a String

#### Single or Double Quotes?
Either work, they do have some differences, double quotes interpolate special characters and Ruby.
For example `\n` is a special character for a new line. Using double quotes will allow this character to be evaluated.

```ruby
puts 'abc\nabc'  # => abc\nabc
puts "abc\nabc"  # => abc
                 #    abc
name = "Boo Radley"
'Hi, my name is #{name}' # => "Hi, my name is \#{name}"
"Hi, my name is #{name}" # => "Hi, my name is Boo Radley"
```

Use double quotes by default, this gives the most flexibility and it's more common that
you'd need to use a `'` inside of a sentence than a `"`. If you want to use a double quote
character inside of a string with double quotes use the `/` character to escape the quote character.
```ruby
puts "\"Hello\" I said"
# "Hello" I said
# => nil
```


`Symbol`
--------
Symbols are a lot like strings but they are meant to represent names (short strings), basically it's text that is meant only for keeping track of the name of something inside of a ruby application. An identifier.

```ruby
:kari.object_id # => 483528
:kari.object_id # => 483528

"kari".object_id # => 70259726644020
"kari".object_id # => 70359726563680
```

`Numbers`
--------
Numbers are pretty obvious, but maybe not as simple as you might think. Numbers can be a few different datatypes, the most common in ruby are Integer and Float.The most obvious difference is the decimal point.

`Integer` objects are whole numbers (`1`, `9999`, `-255`) and are most commonly used.

`Float` objects are numbers with a decimal point (`3.14`, `0.001`) and are most often used for mathmatics.

Use Integers unless you have a specific reason not to.

```ruby
10 * 10
 # => 100
2 / 3
 #=> 0
2.0 / 3.0
 # => 0.66666666666
# Notice Integers and Floats share many arithmetic methods,
# but they won’t always produce the same result.

2.4 * ((100/99.88) * 4.2**8) - 77
 # => 232585.84332597523
# Also notice that you can even mix and match Integers and Floats
# (be careful, you may not always get the type that you expect back)
```

Check out the Documentation for [Integers](http://www.ruby-doc.org/core-2.2.3/Integer.html) and [Floats](http://www.ruby-doc.org/core-2.2.3/Float.html).

Collections
-----------
Were going to talk about the two most common collection types in Ruby, `Array` and `Hash`.

### `Array`

An `Array` is an ordered collection of any object

```ruby
[1, "hello", 3.14]
```

Some things to note:

1. We created the `Array` simply by using `[]`.
2. The objects within the array are not all of the same type, we have an `Integer`, `String`, and `Float`

Arrays are integer-indexed, what this means is that each item in the array corresponds to an integer
value. and that integer is used to access an object within the `Array`. The first object is assigned
0 and increments up from there. Ruby also allows for negative indexing, so -1 corresponds to the
last element, -2 the second to last and so on.

```ruby
a = [1, "hello", 3.14]
a[0] # => 1
a[1] # => "hello"
a[2] # => 3.14
a[-1] # => 3.14
```

### `Hash`

A `Hash` is a lot like an array, it is a collection of key/value pairs:

```ruby
{first_num: 1, greeting: "Hello", pi: 3.14}
```

This doesn't seem a lot like an `Array`, but if you think of the key of the key/pair as the index
they have a lot more in common. In this above case, we have the equivelant of an `Array` with `[1, "hello", 3.14]`
but instead of the indices 0,1,2, we use first_num, greeting, pi.

```ruby
h = {first_num: 1, greeting: "Hello", pi: 3.14}
h[:first_num] # => 1
h[:greeting] # => "Hello"
h[:pi] # => 3.14

```
Look at the Ruby docs for [Array](http://www.ruby-doc.org/core-2.2.3/Array.html) and [Hash](http://www.ruby-doc.org/core-2.2.3/Hash.html) for more info

Resources
---------
- http://www.ruby-doc.org/core-2.2.3/String.html
- http://www.ruby-doc.org/core-2.2.3/Integer.html
- http://www.ruby-doc.org/core-2.2.3/Float.html
- http://www.ruby-doc.org/core-2.2.3/Array.html
- http://www.ruby-doc.org/core-2.2.3/Hash.html
