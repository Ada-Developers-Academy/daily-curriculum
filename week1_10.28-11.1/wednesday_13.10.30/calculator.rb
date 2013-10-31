def add_numbers(first, second)
  first + second
end

def subtract_numbers(first, second)
  first - second
end

puts "add or subtract?"
action = gets.downcase

puts "First number?"
first_num = gets.chomp.to_i

puts "Second number?"
second_num = gets.chomp.to_i

if action == "add" # without chomp action is "add/n"
  result = add_numbers(first_num, second_num)
elsif action == "subtract"
  result = subtract_numbers(first_num, second_num)
else
  result = "Sorry, I don't know how to do that, Dave."
end

puts result