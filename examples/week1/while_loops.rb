def fred(max_number, increment)
  numbers = []
  i = 0
  num_range = (i..max_number)

  num_range.step(increment) do |num|
    puts "At the top i is #{num}"
    numbers.push(i)

    i = i + increment
    puts "Numbers now: #{numbers}"
    puts "At the bottom i is #{i}"
  end

puts "The numbers: "

numbers.each do |num|
  puts num
end

fred(10, 2)

# Next Steps
# 1) Convert this while loop to a method that you can call, and replace 6 in the test (i < 6) with a variable.
# 2) Now use this method to rewrite the script to try different numbers.
# 3) Add another variable to the method arguments that you can pass in that lets you change the + 1 on line 8 so you can change how much it increments by.
# 4) Rewrite the script again to use this method to see what effect that has.
# 5) Now, write it to use for-loops and ranges instead. Do you need the incrementor in the middle anymore? What happens if you do not get rid of it?
