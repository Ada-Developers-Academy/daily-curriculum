puts "It's a cool autumn after noon. You've been wondering around capitol hill. You're enjoying a lovely Molly Moons ice cream cone. Ahhh... this city is the best..."
puts "You notice a strange pod on the ground in Cal Anderson park, you walk over to investigate. You pull on a hatch on the outside of the pod, you feel the pressure around you changing, the pod bursts open and the wind starts rushing into the empty void inside the pod."
puts "You've suddenly been sucked into a cryogenic time machine?"
puts "What year do you think it is?"
year = gets.chomp.to_i

if year >= 2013 # Off shoot 1
	puts "The human race has been obliterated. All clues indicate the the feline race has taken over. Cat toys are everywhere. Sky scrapers have been replaced with oversized scratching posts. Cat's lazily lay everywhere."
	puts "Do you LOVE cats?"
	response = gets.chomp
	if response[0].downcase == "y"
		puts "You're not in a time machine! You've died and gone to heaven!"
	else
		puts "The future is bleak.... guhhhh...."
	end
end

if year < 1500 # Off shoot 2
	today = "October"
	puts "You've landed in King Arthurs court! There aren't many friendly faces around. It looks like they may think you are a practitioner of the black arts. Luckily you know that a solar eclipse occurs at #{Time.now.strftime('%I:%M:%S %p')} on #{Time.now.strftime('%B %d, %Y!')}"
	puts "Do you want to show off your 'black arts' by predicting the eclipse?"
	response = gets.chomp
	if response[0].downcase == "y"
		puts "The kingdom is terrified of your great power. But you show compassion and let all know that you won't use your great power for harm unless you are threatened. You live a long and happy life as Merlins succussor."
	else
		puts "You are burned at the stake :("
	end
end

if year >= 1500 && year < 2013 # Off shoot 3
	puts "Be careful not to touch anything. What if you disturb the space time continuum!?! *Silently waits...*"
end
