class Dungeon
  attr_accessor :player
  
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms  = []
  end
  
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  
  # location should be a symbol that references a room
  def start(location)
    @player.location = location
    show_current_description
  end
  
  def show_current_description
    # Possible solution: reassign players location
    # if @player.location == nil
      # @player.location = :largecave
    # end
    puts find_room_in_dungeon(@player.location).full_description
  end
  
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end
  
  def find_room_in_direction(direction)
    room = find_room_in_dungeon(@player.location).connections[direction]
    if room == nil
      @player.location
    else
      room
    end
  end
  
  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
  
  class Player
    attr_accessor :name, :location
    def initialize(player_name)
      @name = player_name
    end
  end
  
  class Room
    attr_accessor :reference, :name, :description, :connections
    def initialize(reference, name, description, connections)
      @reference   = reference
      @name        = name
      @description = description
      @connections = connections
    end
    
    def full_description
      @name + "\n\nYou are in " + @description
    end
  end
end


# my_dungeon = Dungeon.new("Bookis")

# my_dungeon.add_room(:smallcave, "Small Cave", "a small cave", {:east => :largecave})
# my_dungeon.add_room(:largecave, "Large Cave", "a large cave", {:west => :smallcave})







