1.upto(100).each do |n|
  if n % 15 == 0
    string = "FizzBuzz"
  elsif (n.to_f / 3).to_s.include?(".0")
    string = "Fizz"
  elsif (n.to_f / 5).to_s.include?(".0")
    string = "Buzz"
  else
    string = n
  end
  puts string
end
