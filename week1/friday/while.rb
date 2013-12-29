def while_num_loop(n,m)

  numbers  = []

  (n..m).each do |array_number| 
    puts "i now #{array_number}!"
    numbers.push(array_number)
    puts "Numbers now: #{numbers}"
  end
  
  puts "The numbers:"

  for num in numbers
    puts num
  end
end

while_num_loop(1,5)