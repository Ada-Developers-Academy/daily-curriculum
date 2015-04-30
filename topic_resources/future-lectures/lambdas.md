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
add = -> (a, b) { return a + b } # the -> is a stabby lambda
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

Different format, same output.

#### Question: Why would I use `{}` versus `do/end`?

Last example, putting it all together:

```ruby

```
