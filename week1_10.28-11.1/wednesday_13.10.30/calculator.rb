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

def exponential_numbers(first, second)
  first ** second
end

def square_root(first)
  Math.sqrt(first)
end

def is_it_an_integer(num)
  if num.to_f.to_i == num.to_f
    return num.to_i
  else
    return num
  end
end

puts "add, subtract, multiply, divide, exponents, or square root?"
action = gets.downcase.chomp

if action == "add" || action == "+" || action == "subtract" || action == "-" || action == "multiply" || action == "*" || action =="divide" || action =="/" || action =="exponents" || action == "**" || action == "square root"
  puts "First number?"
  first_num = gets.chomp.to_f
  if first_num.nil?
    first_num = 0
  end

  if action != "square root"
    puts "Second number?"
    second_num = gets.chomp.to_f
    if second_num.nil?
      second_num = 0
    end
  end
end

if action == "add" or action == "+" # without chomp action is "add/n"
  result = add_numbers(first_num, second_num)
  puts is_it_an_integer(first_num).to_s + " + " + is_it_an_integer(second_num).to_s + " = " + is_it_an_integer(result).to_s
elsif action == "subtract" or action == "-"
  result = subtract_numbers(first_num, second_num)
  puts is_it_an_integer(first_num).to_s + " - " + is_it_an_integer(second_num).to_s + " = " + is_it_an_integer(result).to_s
elsif action == "multiply" or action == "*"
  result = multiply_numbers(first_num, second_num)
  puts is_it_an_integer(first_num).to_s + " * " + is_it_an_integer(second_num).to_s + " = " + is_it_an_integer(result).to_s
elsif action == "divide" or action == "/"
  result = divide_numbers(first_num, second_num)
  puts is_it_an_integer(first_num).to_s + " / " + is_it_an_integer(second_num).to_s + " = " + is_it_an_integer(result).to_s
elsif action == "exponents" or action == "**"
  result = exponential_numbers(first_num, second_num)
  puts is_it_an_integer(first_num).to_s + " to the " + is_it_an_integer(second_num).to_s + " power = " + is_it_an_integer(result).to_s
elsif action == "square root"
  result = square_root(first_num)
  puts "The square root of " + is_it_an_integer(first_num).to_s + " = " + is_it_an_integer(result).to_s
else
  result = "Sorry, I don't know how to do that, Dave."
  puts result
end

#puts "Would you like to do anything else to this new number?"
