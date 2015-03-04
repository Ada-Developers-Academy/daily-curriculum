def calculate(operation, num1, num2)
  if operation == "add"
    add(num1, num2)
  elsif operation == "subtract"
    subtract(num1, num2)
  end
end

def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

puts "Hello!"

quit = false

while quit != true
  puts "What would you like to compute?"
  puts "Start by giving me the operation (add or subtract)..."
  operation = gets.chomp

  if operation =~ /bye/
    quit = true
    puts "Goodbye"
  else
    puts "what is the first number?"
    num1 = gets.chomp

    puts "...and the second number?"
    num2 = gets.chomp

    answer = calculate(operation, num1.to_i, num2.to_i)
    if answer.nil?
      puts "Oops the operation '#{operation}' isn't in this calculator."
      puts "Try again."
    else
      puts "The answer is #{answer}"
    end
  end
end
