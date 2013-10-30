def add_numbers(first, second)
  first + second
end

def subtract_numbers(first, second)
  first - second
end

puts "Add or subtract?"
action = gets.chomp.downcase

while action != "add" and action != "+" and action != "subtract" and action != "-"
  puts "C'mon, Dave. Add or subtract?"
  action = gets.chomp.downcase
end

puts "First number?"
first_num = gets.chomp

while first_num.to_i == 0
  puts "Please enter an integer, Dave."
  first_num = gets.chomp
end
first_num = first_num.to_i

puts "Second number?"
second_num = gets.chomp

while second_num.to_i == 0 # and second_num.length > 1
  puts "Please enter an integer, Dave."
  second_num = gets.chomp
end
second_num = second_num.to_i

if action == "add" or action == "+"
  result = add_numbers(first_num, second_num)
elsif action == "subtract" or action == "-"
  result = subtract_numbers(first_num, second_num)
end

puts result