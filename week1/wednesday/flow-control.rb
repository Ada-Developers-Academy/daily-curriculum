gputs "Hey! What’s your name?"
response = gets.chomp

if response.downcase == 'computer'
  puts "Weird, that's my name too. Small world!"
else
  puts "Wacky name!"
end

puts "Well, it was nice to meet you " + response + "."
