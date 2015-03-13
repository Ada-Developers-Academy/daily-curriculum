def sing_bottles_song(number_of_bottles)
  if number_of_bottles == 1
    puts "1 bottle of beer on the wall.."

    puts "0 bottles of beer left!"
  else
    puts number_of_bottles.to_s + " bottles of beer on the wall.."

    puts  (number_of_bottles - 1).to_s + " bottles of beer left!"
  end

  puts "We started with " + number_of_bottles.to_s + " bottles."
  puts "----------------------"
end

puts "How many bottles?"
bottles = gets.chomp.to_i

until bottles == 0
  sing_bottles_song(bottles)
  bottles = bottles - 1
end
