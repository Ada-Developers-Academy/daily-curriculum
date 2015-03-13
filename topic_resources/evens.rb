numbers = ["a",1,1,3,4,5]

# def evens(numbers)
#   array = []
#   numbers.each {|n| array << n if n % 2 == 0}
#   return array
# end

# def evens(numbers)
#   numbers.collect {|n| n if n % 2 == 0}.compact
# end

def evens(numbers)
  array = []
  numbers.each_with_index {|n, i| array << n if i % 2 == 0}
  array
end


def evens(numbers)
  array = []
  i = 2
  while i < numbers.length
    array << numbers[i]
    i += 2
  end
  array
end

puts evens(numbers).inspect
