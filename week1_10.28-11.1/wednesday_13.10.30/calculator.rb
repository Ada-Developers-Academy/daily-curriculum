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

def expo(first, second)
	first ** second
end

def sq(first)
	Math.sqrt(first)
end

puts "+, -, *, /, find the exponent or find the square root?"
action = gets.chomp.downcase

if action != "find the square root" 
  puts "First number?"
  first_input = gets.chomp 
  if first_input.empty?
  	
  	while first_input == empty?
  	  puts "Hey, you did not put in a number! Do that."
      first_input = gets.chomp
  end
  first_num = first_input.to_i

  
  puts "Second number?"
  second_num = gets.chomp.to_i
else 
	puts "What's the number?"
	single_num = gets.chomp.to_i
end

if action == "+" # without chomp action is "add/n"
  result = puts "#{first_num} + #{second_num} = #{add_numbers(first_num, second_num)}"
elsif action == "-"
  result = puts "#{first_num} - #{second_num} = #{subtract_numbers(first_num, second_num)}" 
elsif action == "*"
  result = puts "#{first_num} * #{second_num} = #{multiply_numbers(first_num, second_num)}"
elsif action == "/"
  result = puts "#{first_num} / #{second_num} = #{divide_numbers(first_num, second_num)}"
elsif action == "find the exponent"
  result = "#{first_num} ** #{second_num} = #{expo(first_num, second_num)}"
elsif action == "find the square root"
	result = "the square root of #{single_num} = #{sq(single_num)}"
	
else
  result = "Sorry, I don't know how to do that, Dave."
end

puts result