class Baker
  attr_accessor :rolling_pin, :apron, :ovens
  attr_reader :eggs, :butter, :sugar, :flour

  def initialize(options_hash)
    @flour  = 2
    @butter = 5
    @sugar  = 3
    @eggs   = 23
    @rolling_pin = options_hash[:rolling_pin]
    @apron = options_hash[:apron]
    @ovens = options_hash[:ovens]
  end

  def turn_off_ovens
    @ovens.each do |oven|
      oven.on = false
    end

    puts "Ok, its safe to go home! Good night!"
  end

  def make_cookies
    heat_oven(find_a_free_oven, 375)
    # other steps in the recipe...
    # gather_ingredients(sugar, flour, eggs)
    # mix_ingredients_in_blender()
    # put_in_oven
  end

  def find_a_free_oven
    free_oven = # some oven that's
    return free_oven
  end

  def heat_oven(baking_oven, temperature)
    baking_oven.set_temperature(temperature)
  end
end