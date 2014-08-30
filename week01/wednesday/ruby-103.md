# Ruby 103
## Blocks & Literals

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

What is a block? Technically it's something called a `Proc` (Procedure). `Proc` is a class and a block is an instance of that class. It's an object that stores a chunk of code that it can execute at anytime

```
proc = Proc.new {|n| n + 100 }
proc.call(1) # 101
```

Another potential gotcha is if you try to give a Hash as an argument to a method using a space, Ruby will think you are passing it a `Hash`

```ruby
def some_method_that_takes_a_hash(hash)
  hash
end

some_method_that_takes_a_hash {foo: :bar} # => syntax error

```
