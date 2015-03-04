# Ruby - A Dynamic Language
## (A gentle introduction to metaprogramming)

## What is "Metaprogramming"?
Metaprogramming in Ruby is writing code that changes the language constructs (like classes, modules, and instance variables). It is even possible to enter new Ruby code as we run it and execute the new code without restarting the program!

### (re)opening a class

Unlike many other computer programming languages, in Ruby, we can add new methods and modify existing methods on an existing class at any time, even while the program is running. This is commonly referred to as "reopening a class".

In the previous section, I showed you this possible solution for factorials:

```ruby
def factorial(num = self)
  return "Can not calculate factorial of a negative number" if num < 0

  if num <= 1
    1
  else
    num * factorial(num - 1)
  end
end

> factorial(5)
=> 120
```

We can get fancier, though, and add this to the Integer class directly, by reopening the Integer class and typing in the method.

```ruby
class Integer
  def factorial(num = self)
    return "Can not calculate factorial of a negative number" if num < 0

    if num <= 1
      1
    else
      num * factorial(num - 1)
    end
  end
end

> 5.factorial
=> 120
```

This is quite useful when writing gems and library to create new functionality. You don't have to just *add* new methods, you can change the behavior of existing methods completely.

```
[1] pry(main)> "123".to_i
=> 123
[2] pry(main)> class String
[2] pry(main)*   def to_i
[2] pry(main)*     puts "No, I hate numbers!"
[2] pry(main)*   end
[2] pry(main)* end
=> nil
[3] pry(main)> "123".to_i
No, I hate numbers!
=> nil
```

So you can see, its important to be careful!

## Aliases

Say you have this class:

```ruby
class Dog
  def bark
    puts "woof!"
  end
end

[5] pry(main)> fido = Dog.new
=> #<Dog:0x007f88ae09afe0>
[6] pry(main)> fido.bark
woof!
=> nil
```

```bark``` doesn't appeal to you, however, since the dog says "woof!" not "bark!" You can use an **alias** to add an alternative way of accessing the method.

```ruby
class Dog
  def bark
    puts "woof!"
  end
  alias :woof :bark
end

[2] pry(main)> d = Dog.new
=> #<Dog:0x007ffea3b81718>
[3] pry(main)> d.bark
woof!
=> nil
[4] pry(main)> d.woof
woof!
=> nil
```

That's all for now, but you can see from this that Ruby is a dynamic, sometimes slippery language! We'll continue to explore these features of Ruby in the coming weeks.



