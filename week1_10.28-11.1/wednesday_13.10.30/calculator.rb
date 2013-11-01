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
	first.to_f / second.to_f
end

def expo_numbers(first, second)
	first ** second
end

puts "Hi there! What's your name?"
name = gets.chomp
if name == ""
	name = "Dave"
end

puts "#{name}, what would you like to do? Add, subtract, divide, multiply? Or maybe exponentiate? Or do you want a square root?"
action = gets.chomp.downcase
if !["add","+","subtract","-","multiply","*","exponentiate","**","square root","divide","/"].include? action
	puts "Sorry, I don't know how to do that."
	exit
end

puts "First number?"
first_num = gets.chomp
while first_num.empty?
	puts "That's not an appropriate number. Try again!"
	first_num = gets.chomp
end

while true
	begin
	Float(first_num)
	break
	rescue ArgumentError
	puts "That's not an appropriate number. TRY AGAIN."
	first_num = gets.chomp
  end
end

first_num = first_num.to_i

if action != "square root"
puts "Second number?"
second_num = gets.chomp
while second_num.empty?
	puts "That's not an appropriate number. Try again!"
	second_num = gets.chomp
end
second_num = second_num.to_i
end

case action
when "add","+"
	result = add_numbers(first_num, second_num)
  action = "+"
when "subtract","-"
	result = subtract_numbers(first_num, second_num)
	action = "-"
when "multiply","*"
	result = multiply_numbers(first_num, second_num)
	action = "*"
when "divide","/"
	result = divide_numbers(first_num, second_num)
	action = "/"
when "exponentiate","**"
	result = expo_numbers(first_num, second_num)
 	action = "^"
when "square root"
 	result = Math.sqrt(first_num).to_i
end

# if ["add", "+"].include? action 
#   result = add_numbers(first_num, second_num)
#   action = "+"
# elsif ["subtract","-"].include? action
#   result = subtract_numbers(first_num, second_num)
#   action = "-"
# elsif ["multiply","*"].include? action
# 	result = multiply_numbers(first_num, second_num)
# 	action = "*"
# elsif ["divide","/"].include? action
# 	result = divide_numbers(first_num, second_num)
# 	action = "/"
# elsif ["exponentiate","**"].include? action
# 	result = expo_numbers(first_num, second_num)
# 	action = "^"
# elsif ["square root"].include? action
# 	result = Math.sqrt(first_num).to_i
# else
#   result = "Sorry, I don't know how to do that, #{name}."
# end

if action == "square root"
	puts "The square root of #{first_num} is #{result}"
else
	puts "#{first_num} #{action} #{second_num} = #{result}"
end