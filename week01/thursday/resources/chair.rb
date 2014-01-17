class Furniture
  attr_accessor :name, :color

  def initialize(name_var, color_var)
    @name = name_var.reverse
    @color = color_var
    @weight = 30
  end

  def weight_in_lbs
    @weight
  end

  def weight_in_lbs=(num)
    @weight = num
  end
  
  def max_height
    23.625
  end

  def self.all
    [["Vilgot", "Red"], ["Mika", "Blue"]].map do |name, color|
      new(name, color)
    end
  end
end


class Chair < Furniture


  def self.description
    "A chair is a piece of furniture with a raised surface used to sit on, commonly for use by one person."
  end

  def type
    "Swivel"
  end


end