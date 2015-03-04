class Oven
  attr_accessor :temperature, :racks, :on
  attr_reader :window, :timer, :clock, :color, :type

  def initialize(oven_options)
    @type   = oven_options[:type]
    @window = oven_options[:window]
    @timer  = oven_options[:timer]
    @clock  = oven_options[:clock]
    @racks  = oven_options[:racks]
    @color  = oven_options[:color]
    @on     = false
  end

  def set_temperature(temperature)
    @temperature = temperature
    puts "The temperature is now #{temperature}"
  end

  def open_door

  end

  def check_timer

  end

  def clean

  end
end

oven = Oven.new({:type => "gas", :color => "steel", :racks => 2})