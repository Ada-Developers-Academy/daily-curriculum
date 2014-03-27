class EventEmitter
  def initialize
    @events = {}
  end

  def trigger(event_name, *value)
    return nil unless @events[event_name]

    @events[event_name].each do |event|
      event.call(*value)
    end
  end

  def on(event_name, &block)
    if @events[event_name]
      @events[event_name] << block
    else
      @events[event_name] = [block]
    end
  end
end

e = EventEmitter.new

e.trigger('new_user')

e.on('new_user') { |user| puts "#{user} Subscribed!" }
e.trigger('new_user', 'Fred')

# Fred Subscribed!

e.on('new_user') { |user| puts "Gotta remember to email #{user}!" }
e.trigger('new_user', 'Thelma')

# Thelma Subscribed!
# Gotta remember to email Thelma!

e.on('new_user') { |user, company| puts "#{user} from #{company} has subscribed!" }
e.trigger('new_user', 'Louise', 'Twitter, Inc')
# Louise from Twitter, Inc has subscribed!