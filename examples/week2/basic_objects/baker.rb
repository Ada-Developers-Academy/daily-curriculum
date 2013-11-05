class Baker
  attr_accessor :eggs, :butter, :rolling_pin

  def initialize(rolling_pin_variable)
    @flour  = 2
    @butter = 5
    @sugar  = 3
    @eggs   = 23
    @rolling_pin = rolling_pin_variable
  end

  def make_cookies
    heat_oven(350)
  end

  def heat_oven(temperature)
    puts "The oven is heating up to #{temperature}"
  end
end