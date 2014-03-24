e = EventEmitter.new

e.trigger('new_user')

e.on('new_user') { |user| puts "#{user} Subscribed!" }
e.trigger('new_user', 'Fred')

# Fred Subscribed!

e.on('new_user') { |user| puts "Gotta remember to email #{user}!" }
e.trigger('new_user', 'Thelma')

# Thelma Subscribed!
# Gotta remember to email Thelma!