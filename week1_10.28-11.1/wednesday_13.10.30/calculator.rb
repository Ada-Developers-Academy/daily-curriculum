def add_numbers(first, second)
  first + second
end

def subtract_numbers(first, second)
  first - second
end

def multiply_numbers(first, second)
  first * second
end

def divide_numbers(first, second)
  first / second
end

def exponent(first, second)
  first ** second
end

puts "What's your name?"
name = gets.chomp

if name.empty?
  name = "Dave"
  puts "Fine, I'll call you Dave. What would you like me to do?"
else
  puts "Hi #{name}. What would you like me to do?"
end

puts "I can add, subtract, multiply, divide, or find an exponent or square root."
action = gets.chomp.downcase

while action != "add"     and 
  action != "+"           and 
  action != "subtract"    and 
  action != "-"           and 
  action != "multiply"    and 
  action != "*"           and 
  action != "divide"      and 
  action != "/"           and 
  action != "exponent"    and
  action != "^"           and 
  action != "square root" and
  action != "sqrt"
  puts "C'mon, #{name}... Add, subtract, multiply, divide, exponent, or square root?"
  action = gets.chomp.downcase
end

if action == "square root" or action == "sqrt"
  puts "Number?"
  number = gets.chomp

  while number.to_i == 0
    puts "Please enter an integer, #{name}."
    number = gets.chomp
  end

  number = number.to_i
  sqrt = Math.sqrt(number).to_s

  if sqrt[-1] == "0" and sqrt[-2] == "."
    sqrt = sqrt.to_i
    puts "The square root of " + number.to_s + " is #{sqrt}."
  else
    puts "The square root of " + number.to_s + " is #{sqrt}."
  end
  exit
end

puts "First number?"
first_num = gets.chomp

if first_num != "0"
  first_num = first_num.to_i

  while first_num == 0
    puts "Please enter an integer, " + name + "."
    first_num = gets.chomp
  end
end
first_num = first_num.to_i

puts "Second number?"
second_num = gets.chomp

if second_num != "0"
  second_num = second_num.to_i

  while second_num == 0
    puts "Please enter an integer, " + name + "."
    second_num = gets.chomp
  end
end
second_num = second_num.to_i

if action == "add" or action == "+"
  result = add_numbers(first_num, second_num)
  puts first_num.to_s + " + " + second_num.to_s + " = " + result.to_s
elsif action == "subtract" or action == "-"
  result = subtract_numbers(first_num, second_num)
  puts first_num.to_s + " - " + second_num.to_s + " = " + result.to_s
elsif action == "multiply" or action == "*"
  result = multiply_numbers(first_num, second_num)
  puts first_num.to_s + " * " + second_num.to_s + " = " + result.to_s
elsif action == "divide" or action == "/"
  result = divide_numbers(first_num, second_num)
  puts first_num.to_s + " / " + second_num.to_s + " = " + result.to_s
elsif action == "exponent" or action == "^"
  result = exponent(first_num, second_num)
  puts first_num.to_s + " ^ " + second_num.to_s + " = " + result.to_s
end