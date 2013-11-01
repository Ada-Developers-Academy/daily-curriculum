!SLIDE title-and-content transition=fade

More About Conditionals
=======================

In the calculator project, we talked about conditionals

```ruby
if 1 > 0
  # do something
else 
  # do something different
end
```

!SLIDE text-size-90 title-and-content transition=fade

Comparisons
===========

+ > 
+ <
+ ==
+ >=
+ <=
+ !=

!SLIDE text-size-90 title-and-content transition=fade

Compound Conditions
===================

Comparison expressions are often combined:

+ **OR** or **||**
+ **AND** or **&&**

!SLIDE text-size-90 title-and-content transition=fade

Compound Conditions
===================

```ruby
if 1 > 0 && 1 < 10
  # do something
else 
  # do something different
end
```

!SLIDE text-size-90 title-and-content transition=fade

Calculator Example
===================

```ruby
if command == "add"
  # add numbers
elsif command == "+"
  # also adds numbers
end
```

!SLIDE text-size-90 title-and-content transition=fade

Calculator Example
==================

```ruby
if command == "add" || command == "+"
  # adds numbers
elsif command == "subtract" || command == "-"
  # subtract the numbers
end
```

!SLIDE text-size-90 title-and-content transition=fade

Wait a ```while```
=============

```ruby
command = gets.chomp

while command != "add" && command != "+" && command != "subtract" && command != "-"
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```


!SLIDE text-size-90 title-and-content transition=fade

Make it clearer by using ```Until```
==================

```ruby
command = gets.chomp

until command == "add" || command == "+" || command == "subtract" || command == "-"
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```

!SLIDE text-size-90 title-and-content transition=fade

Make it clearer by using ```Until```
==================

```ruby
command = gets.chomp

until ["add", "+", "subtract", "-"].include? command
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```

!SLIDE text-size-90 title-and-content transition=fade

case/when
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

!SLIDE text-size-90 title-and-content transition=fade

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


!SLIDE title-and-content transition=fade

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

