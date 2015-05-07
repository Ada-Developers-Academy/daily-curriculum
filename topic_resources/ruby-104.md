More About Conditionals and Flow Control
=======================

In the calculator project, we talked about conditionals

```ruby
if 1 > 0
  # do something
else
  # do something different
end
```
Comparisons
===========

- >
- <
- ==
- \>=
- <=
- !=


Compound Conditions
===================

Comparison expressions are often combined:

+ **OR** or **||**
+ **AND** or **&&**

```ruby
if command == "add"
  # add numbers
elsif command == "+"
  # also adds numbers
end
```

```ruby
if command == "add" || command == "+"
  # adds numbers
elsif command == "subtract" || command == "-"
  # subtract the numbers
end
```

Wait a ```while```
=============

Execute the iterator ```while``` the condition is true.

```ruby
i = 0

while i < 4
  puts i
  i += 1
end
```

The above code will output the values of `i` until `i` is no longer less than 4, resulting in the following output:
```
0
1
2
3
```

```ruby
command = gets.chomp

while command != "add" && command != "+"
  puts "Please tell me to add (+)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```


Make it clearer by using ```until```
==================

Execute the iterator ```until``` the condition is true.

```ruby
i = 0

until i == 4
   puts i
   i += 1
end
```

The above code will output the values of i until i is equal to 4, resulting in the following (equivalent to the above) output:
```
0
1
2
3
```

Make it clearer by using `include?`
==================

```ruby
command = gets.chomp

until command == "add" || command == "+" || command == "subtract" || command == "-"
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```

Instead of using a bunch of ||, you can make it more readable by doing something like this:

```ruby
command = gets.chomp

until ["add", "+", "subtract", "-"].include? command
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```

More complex conditionals
==================

```ruby
if command == "add" || command == "+"
  # adds numbers
elsif command == "subtract" || command == "-"
  # subtract the numbers
elsif command == "multiply" || command == "*"
  # multiply the numbers
elsif command == "divide" || command == "/"
  # divide the numbers
elsif command == "exponify" || command == "**"
  # exponify the number
elsif command == "sqrt"
  # find the square root of the number
end
```

case/when
==================

```ruby
case command
when "add", "+"
  # adds numbers
when "subtract", "-"
  # subtract the numbers
when "multiply", "*"
  # multiply the numbers
when "divide", "/"
  # divide the numbers
when "exponify", "**"
  # exponify the number
when "sqrt"
  # find the square root of the number
end
```
