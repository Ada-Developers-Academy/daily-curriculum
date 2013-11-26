require "./oven.rb"

class Baker
  attr_accessor :rolling_pin, :apron
  attr_reader :eggs, :flour, :butter, :eggs

  def initialize(options_hash)
    @apron = options_hash[:apron]
    @rolling_pin = options_hash[:rolling_pin]
    @flour = 2
    @sugar = 3
    @eggs =23
    @butter = 5
    @ovens = Oven.new({:type => "gas",
                      :color => "steel",
                      :racks => 2})
  end

  def turn_off_ovens
    @ovens.each do |oven|
      oven.on = false
    end
  end

  def make_cookies
    heat_oven(@ovens[0], 375)
  end

  private
  def find_a_free_oven
    free_oven = oven.first
    return free_oven
  end 

  def heat_oven(ovens, temperature)
    ovens.set_temperature(temperature) #not defined, will break code
  end
end

oven = Oven.new(:color => "yellow")
new_oven = Oven.new(:color => "steel")

bob = Baker.new({:oven => [oven, new_oven]})

bob.ovens[0].color

bob.ovens.select{ |oven| oven.color == "yellow"}
