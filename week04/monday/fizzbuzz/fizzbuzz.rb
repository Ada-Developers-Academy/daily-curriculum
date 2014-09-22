1.upto(100).each do |n|
  if (n.to_f / 3).to_s.include?(".0") && (n.to_f / 5).to_s.include?(".0")
    puts "FizzBuzz"
  elsif (n.to_f / 3).to_s.include? ".0"
    puts "Fizz"
  elsif (n.to_f / 5).to_s.include? ".0"
    puts "Buzz"
  else
    puts n
  end
end
