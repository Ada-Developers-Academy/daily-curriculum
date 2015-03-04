# Code for selection sort from “Computer Science Programming Basics with Ruby.”
#   by Ophir Frieder, Gideon Frieder, and David Grossman.

# 35 students in our class
NUM_STUDENTS = 15

# Max grade of 100%
MAX_GRADE = 100

num_compare = 0
arr = Array.new(NUM_STUDENTS)

# Randomly populate arr
for i in (0..NUM_STUDENTS - 1)
  # Maximum possible grade is 100%, keep in mind that rand(5) returns possible
  #   values 0-4, so we must add 1 to MAX_GRADE
  arr[i] = rand(MAX_GRADE + 1)
end

# Output current values of arr
puts "Input list:"

for i in (0..NUM_STUDENTS - 1)
  puts "  arr[" + i.to_s + "] ==> " + arr[i].to_s
end

puts "\n-------------------\n\n"

# Now let's use a selection sort. We first find the lowest number in the
#   array and then we move it to the beginning of the list
for i in (0..NUM_STUDENTS - 2)
  min_pos = i
  for j in (i + 1)..(NUM_STUDENTS - 1)
    num_compare = num_compare + 1

    if (arr[j] < arr[min_pos])
      min_pos = j
    end
  end

  # Knowing the min, swap with current first element (at position i)
  temp         = arr[i]
  arr[i]       = arr[min_pos]
  arr[min_pos] = temp
end

# Now output the sorted array
puts "Sorted list:"
for i in (0..NUM_STUDENTS - 1)
  puts "  arr[" + i.to_s + "] ==> " + arr[i].to_s
end

puts "\nNumber of Comparisons ==> " + num_compare.to_s

