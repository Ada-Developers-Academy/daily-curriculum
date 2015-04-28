class Ghost

  def initialize(name_var)
    @name = name_var
  end

  def name
    @name
  end

  def full_name
    if name == "casper"
      my_name = "Bookis"
      "#{@name} the ghost"
    else
      @name
    end
    my_name
  end

  def self.rise_from_the_grave
     # @name won't work here because this is a class method
     puts "Rising..."
  end
end
