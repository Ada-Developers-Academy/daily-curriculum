def make_array
	puts "Enter your lower bound: "
	lower = gets.chomp.to_i
	puts "Enter your upper bound: "
	upper = gets.chomp.to_i
	puts "Enter your increment"
	inc = gets.chomp.to_i

	numbers = []

	(lower..upper).step(inc) do |number|
		numbers.push(number)
		puts "Your lower bound is #{number}"
		puts "Now you have #{numbers}"
		if number < upper - inc
			puts "Your upper bound is #{number}"
		end
	end
	# while lower <= upper
	#   puts "Your lower bound is now #{lower}"
	#   numbers.push(lower)

	#   lower = lower + 1
	#   puts "Numbers now: #{numbers}"
	#   puts "The next number is #{lower}"
	# end

	puts "Let's see what's in your basket! "

	numbers.each do |num|
		puts num
	end
end 

make_array

# Next Steps
# 1) Convert this while loop to a method that you can call, and replace 6 in the test (i < 6) with a variable.
# 2) Now use this method to rewrite the script to try different numbers.
# 3) Add another variable to the method arguments that you can pass in that lets you change the + 1 on line 8 so you can change how much it increments by.
# 4) Rewrite the script again to use this method to see what effect that has.
# 5) Now, write it to use for-loops and ranges instead. Do you need the incrementor in the middle anymore? What happens if you do not get rid of it?
