#
# This block is commented out so that I can keep track of original while refactoring
#
#def number_stack(stack_size, step_size)
#	i = 0
#	numbers = []
#	while i < stack_size
#  	puts "At the top i is #{i}"
#  	numbers.push(i)

#  	i = i + step_size
#  	puts "Numbers now: #{numbers}"
#  	puts "At the bottom i is #{i}"

#	end

#	puts "The numbers: "

#	for num in numbers
#  	puts num
#	end
#end

def number_stack(stack_size, step_size)
	numbers = []
	step_tracker = 0

	for i in (0..stack_size)
		if step_tracker % step_size == 0
			puts "At the top i is #{i}"
			numbers.push(i)
	  	puts "Numbers now: #{numbers}"
	  	puts "At the bottom i is #{i}"
	  	step_tracker = step_tracker + 1
	  else 
	  	step_tracker = step_tracker + 1
	  end
	end

	puts "The numbers: "

	for num in numbers
  	puts num
	end

end

puts "Give me your stack number"
usr_stack = gets.chomp.to_i
puts "What do you want me to increment by?"
usr_incr = gets.chomp.to_i
number_stack(usr_stack, usr_incr)



# Next Steps
# 1) Convert this while loop to a method that you can call, and replace 6 in the test (i < 6) with a variable.
# 2) Now use this method to rewrite the script to try different numbers.
# 3) Add another variable to the method arguments that you can pass in that lets you change the + 1 on line 8 so you can change how much it increments by.
# 4) Rewrite the script again to use this method to see what effect that has.
# 5) Now, write it to use for-loops and ranges instead. Do you need the incrementor in the middle anymore? What happens if you do not get rid of it?
