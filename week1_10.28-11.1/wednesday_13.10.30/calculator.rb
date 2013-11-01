def is_standard(operation)
	if operation == "add"
		standard = true
	elsif operation == "subtract"
		standard = true
	elsif operation == "multiply"
		standard = true
	elsif operation == "exponify"
		standard = true
	elsif operation == "divide"
		standard = true
	elsif operation == "square root"
		standard = true
	else
		standard = false
	end#This checks if the operation is in standard form returns Boolean
end

def standard_op(operation)
	if operation == "+"
		operation = "add"
	elsif operation == "-"
		operation = "subtract"
	elsif operation == "*"
		operation = "multiply"
	elsif operation == "/"
		operation = "divide"
	elsif operation == "**"
		operation = "exponify"
	elsif operation == "exponent"
		operation = "exponify"
	elsif operation == "^"
		operation = "exponify"
	elsif operation == "root"
		operation = "square root"
	elsif operation == "^1/2"
		operation = "square root"
	else
		operation = operation
	end #This checks and standardizes operation
end

def integerize(number)
  integer = number.to_i
  if subtract_numbers(number, integer) == 0
  	integer
  else
  	number
  end
end

def valid_number(string_number) 
	if string_number == "0"
		true
	elsif string_number.to_i != 0
		true
	else
		false
	end
end

def add_numbers(first, second)
  first + second
end

def subtract_numbers(first, second)
  first - second
end

def smart_divide(first, second)
  first / second
end

def multiply_numbers(first, second)
  first * second
end

def exponify_numbers(first, second)
	first ** second
end

def sqrt_number(first)
	Math.sqrt(first)
end
puts "What is your name?"
name = gets.chomp
puts "Would you like to add, subtract, multiply, divide, exponify or square root?"
action = gets.chomp.downcase
action = standard_op(action)
if is_standard(action) != true
	if name != ""
		puts "Sorry, I don't know how to do that, #{name}."
	else
		puts "Sorry, I don't know how to do that, Dave."
	end
else
	puts "First number?"
	first_num = gets.chomp
	if valid_number(first_num)==false
		first_num = false
	else
		first_num = first_num.to_f
	end
		if action != "square root" 
  		puts "Second number?"
  		second_num = gets.chomp
  		if valid_number(second_num)==false
  			second_num==false
  		else
  			second_num = second_num.to_f
			end
	end
end

if first_num
	if action == "square root"
		result = integerize(sqrt_number(first_num))
  	message = "Your equation is root(#{integerize(first_num)}) = #{result}"
		
	end
	if second_num
		if action == "add" # without chomp action is "add/n"
  		result = integerize(add_numbers(first_num, second_num))
  		message = "Your equation is #{integerize(first_num)} + #{integerize(second_num)} = #{result}"
		elsif action == "subtract" 
  		result = integerize(subtract_numbers(first_num, second_num))
  		message = "Your equation is #{integerize(first_num)} - #{integerize(second_num)} = #{result}"
		elsif action == "multiply" 
  		result = integerize(multiply_numbers(first_num, second_num))
  		message = "Your equation is #{integerize(first_num)} * #{integerize(second_num)} = #{result}"
		elsif action == "divide" 
  		result = integerize(smart_divide(first_num, second_num))
  		message = "Your equation is #{integerize(first_num)} / #{integerize(second_num)} = #{result}"
		elsif action == "exponify" 
  		result = integerize(exponify_numbers(first_num, second_num))
  		message = "Your equation is #{integerize(first_num)} ** #{integerize(second_num)} = #{result}"
		end
	else
		puts "Your second number wasn't a number"
	end
else
	puts "Your first number isn't a number"
end

puts message