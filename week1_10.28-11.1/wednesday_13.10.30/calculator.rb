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

def find_exponent(first, second)
	first**second
end

def square_root (number)
	math.sqrt (number)
end



  puts "Hello, what's your name?"
  name = gets.chomp

  puts "Hi, #{name}! Now, would you like to add, subtract, multiply, or divide?"
  action = gets.downcase.chomp
  
puts "First number?"
first_num = gets.chomp.to_i

puts "Second number?"
second_num = gets.chomp.to_i


if action == "add" || action == "+" # without chomp action is "add/n"
    result = add_numbers(first_num, second_num)
elsif action == "subtract" || action == "-"
    result = subtract_numbers(first_num, second_num)	
elsif action == "multiply" || action == "*" 
    result = multiply_numbers(first_num, second_num)
elsif action == "divide" || action == "/"
    result = divide_numbers(first_num, second_num)
else 
    puts "Would you like to find a square root or exponent?" 
    action = gets.downcase.chomp

  if action == "exponent" || action == "find exponent" || action == "**"
      result = find_exponent(first_num, second_num)
  elsif action == "square root" 
      result = square_root(number)
  else
      puts "Sorry, I don't know how to do that, #{name}."
  end
end






puts "Great, your answer is #{result}!"



