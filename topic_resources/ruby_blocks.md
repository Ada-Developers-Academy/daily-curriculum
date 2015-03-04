Blocks
------

Blocks are not a unique features of Ruby, but they're one that many people talk about (and more people use without realizing it!) What is a block?

>A section of code which is grouped together.

Zzzzz....

A block is a piece of code that is not executed immediately, but is stored in a variable or passed to a method, and is potentially executed at a later moment in time. 

Sound complicated? Let's look at some Ruby.

```ruby
2.0.0-p353 :001 > 4+5
 => 9
```

Pretty simple. Now let's try it with variables.

```ruby
2.0.0-p353 :002 > a = 4
 => 4
2.0.0-p353 :003 > b = 5
 => 5
2.0.0-p353 :004 > a+b
 => 9
```

Now, what if we wanted to store this behavior, of `a + b`? Well, we could write a method:

```ruby
2.0.0-p353 :005 > def add(a,b)
2.0.0-p353 :006?>   a + b
2.0.0-p353 :007?>   end
 => nil
2.0.0-p353 :008 > add(4,5)
 => 9
```

That's ok, but there's an easier way.

```ruby
2.0.0-p353 :009 > add = lambda {|a, b| return a + b }
 => #<Proc:0x0000010363fa48@(irb):9 (lambda)>
2.0.0-p353 :010 > add.call(4,5)
 => 9
```

### Q: What's the difference?

Not to confuse you, but to show you another way you might see this formatted. The following two lines of code work identically. 

```ruby
add = lambda {|a, b| return a + b }
add = -> (a, b) { return a + b }
```

The second format is referred to as a **stabby lambda** and you may see it from time to time.

## Why would I need this?

Would you believe you've already been using them without knowing it? Take this bit of Ruby:

```
[1,2,3].select { |n| n.odd? }
```

In the above example, `{ |n| n.odd? }` is a block! We're passing it in to `.select` (a method from the Enumerable module) which loops over each element in the Array and uses the block to determine what to return. 

Here's another use of a block:

```ruby
[1,2,3].select do |n|
  n.odd?
end
```

Different format, same output.

### Q: Why would I use `{}` versus `do/end`? 

If I were to rewrite `.select` in Ruby, it might look something like this:

```ruby
module KerriEnumerable
  def k_each
    i = 0
    while(i < self.length) do
      yield(self[i])
      i += 1
    end
  end

  def k_select
    output = []

    k_each { |e| output << e if yield(e) }

    output
  end
end
```

Copying this into IRB:

```ruby
2.0.0-p353 :018?> class Array
2.0.0-p353 :019?>   include KerriEnumerable
2.0.0-p353 :020?>   end
2.0.0-p353 :021 > [1,2,3].k_select{ |n| n.odd? }
 => [1, 3]
2.0.0-p353 :022 > [1,2,3].k_select{ |n| n.even? }
 => [2]
2.0.0-p353 :023 > [1,2,3].k_select{ |n| puts n }
1
2
3
 => []
2.0.0-p353 :024 >
```

## Working with blocks

When using blocks, we usually only send one block at a time to a method. There are two ways to work with blocks - `yield` and *explicit blocks*

### Yield

You've probably seen `yield` in Rails templates; it features prominently smack dab in the middle of most people's `app/views/layouts/application.erb.html`. `yield` is a **keyword** command (like `def` or `class`) and it tells Ruby to attempt to execute whatever block was passed to the current method.

```ruby
def calculator(a,b)
  yield(a,b)
end

2.0.0-p353 :008 > calculator(4,5){ |a,b| a+b }
 => 9
2.0.0-p353 :009 > calculator(4,5){ |a,b| a*b }
 => 20
2.0.0-p353 :010 > calculator(4,5){ |a,b| a-b }
 => -1
```

What happens if we don't pass a block in to `calculator`?

```ruby
2.0.0-p353 :011 > calculator(4,5)
LocalJumpError: no block given (yield)
    from (irb):6:in `calculator'
    from (irb):11
    from /Users/kerri/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
```

`yield` is a little bit magical, as its actually breaking some of the object oriented rules underlying Ruby, but it has the advantage of being fast. 

### Explicit Blocks

Explicit Blocks, on the other hand, are slower. However, when using `yield` we're not being clear about what we're trying to do. With an explicit block, we're declaring an incoming method parameter to be a block, then executing on it. 

```ruby
def calculator(a,b, &calculation)
  calculation.call(a,b)
end
```

Since `calculation` is an object (a Proc), rather than a magical keyword, we can interact with it and call methods on it. Often this is more practical.



## Resources
[**RubyMonk - Blocks***](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/18-blocks/lessons/51-new-lesson)

Interactive tutorial on blocks.


[**Proc, Block, and Two Smoking Lambdas**](http://verboselogging.com/2011/09/20/proc-block-and-two-smoking-lambdas)

A technical blog post from Daniel Huckstep about the difference between Procs, Blocks, and Lambdas.


[**Building Enumerable & Enumerator in Ruby**](https://practicingruby.com/articles/building-enumerable-and-enumerator)

A great exercise if you have a couple hours and really want to learn this stuff!
