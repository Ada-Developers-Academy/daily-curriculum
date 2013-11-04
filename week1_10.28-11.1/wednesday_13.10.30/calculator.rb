def add_numbers(first, second)
  first + second
end

#def = defines; add_numbers is the variable; (first, second) is data

def subtract_numbers(first, second)
  first - second
end

def divide_numbers(first, second)
  (first/second)
end

def multiply_numbers(first, second)
  (first*second)
end

def exponent_of_a_number(first, second)
  (first**second)
end

def square_root_of_a_number(first)
  (Math.sqrt(first))
end

def check_number(number) #name of method is check_number; number is the argument/variable name
  number.to_i.to_s == number
end


puts "add, subtract, divide, multiply, exponent or sqrt?"
action = gets.chomp.downcase #added chomp

puts "First number?"
  #first_num = gets.chomp.to_i

response = gets.chomp
if check_number(response)
  first_num = response.to_i
else 
  puts "blah blah blah"
end

#response = gets.chomp
#if response.empty?
#  first_num = 0
#else 
  #first_num = response.to_i
#end

if action != "sqrt" 
  puts "Second number?"
  second_num = gets.chomp.to_i
end

if action == "add" or action == "+" # without chomp action is "add/n"
  result = first_num.to_s + " + " + second_num.to_s + " = " + add_numbers(first_num, second_num).to_s
elsif action == "subtract" or action == "-"
  result = first_num.to_s + " - " + second_num.to_s + " = " + subtract_numbers(first_num, second_num).to_s
elsif action == "divide" or action == "/"
  result = first_num.to_s + " / " + second_num.to_s + " = " + divide_numbers(first_num, second_num).to_s
elsif action == "multiply" or action == "*"
  result = first_num.to_s + " * " + second_num.to_s + " = " + multiply_numbers(first_num, second_num).to_s
elsif action == "exponent" or action == "^" or action == "**"
  result = first_num.to_s + " ^ " + second_num.to_s + " = " + exponent_of_a_number(first_num, second_num).to_s
elsif action == "sqrt" or action == "√"
  result = " √ " + first_num.to_s + " = " + square_root_of_a_number(first_num).to_s
    
    
else
  result = "Sorry, I don't know how to do that, Dave."
end

puts result

puts  ---------------

if command == "add"
  # add numbers
elsif command == "+"
  # also add number
end


puts ---------------

command = gets.chomp

until command == "add" || command == "+" || command == "subtract" || command == "-"
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"


# Here's yet a shorter way to execute.
# ? indicates it's a question, asking if it's true or false.  We can add ? to any method.
command = gets.chomp

until ["add", "+", "subtract", "-"].include? command
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "OMG It's about time!"



command = gets.chomp

if ["add", "+"] .incude? command
  puts "You entered " + command
else 
  puts "No."
end


puts -----------

command = gets.chomp

case command
  when "add", "+"
    # adds numbers
  when "subtract", "-"
    # subtract
  when "multiply", "*"
    # multiply
  when "divide", "/"
    # divide
  when "exponify", "^", "**"
    # exponential
  when "sqrt", "√"
    # sqrt
end



puts ------------

# ranges

(1..10) # an example of a range
(1..10).each do |number|
  puts number
end

number = 1

10.times do
  puts number = number + 1
end

puts -----------

(1..10).include 6
(1..10).include 50



'a'..'j'
('a'..'j').each {|letter| puts letter}


foo = 10
bar = 20
(foo..bar).each {|number| puts number}

foo = 10
bar = 20
(foo...bar).each {|number| puts number}



(1..5).each {|n| puts n}



(1..5).to_a.reverse.each {|n| puts n}
# Ruby reads left to right; First turned to array (to_a), then reversed array, then called each number.

(1..99).to_a
(1..99).to_a.reverse
(1..99).to_a.reverse.each do |n|
  puts n.to_s + " bottles of beer on the wall."
  number_left = number - 1
  puts number_left.to_s + " bottles of beer left!"
  # A better way would be puts (number - 1).to_s + 
  puts "--------------"
end

# How would we use a method in this example.

def sing_bottles_song(number_of_bottles)
  if number_of_bottles == 1
  puts number_of_bottles.to_s + " bottle of beer on the wall."
  puts (number_of_bottles - 1).to_s + " bottle of beer left."
  else
  puts number_of_bottles.to_s + " bottles of beer on the wall."
  puts (number_of_bottles - 1).to_s + " bottles of beer left."
  puts "We stared with " + number_of_bottles.to_s + "bottles of beer"
  puts "--------"

end

(1..99).to_a.reverse.each do |number|
  sing_bottles_song(number)
end

puts --------------


puts "How many bottles?"
bottles = gets.chomp.to_i
until bottles == 0
  sing_bottles_song(bottles)
  number = number - 1


# system(say "")

