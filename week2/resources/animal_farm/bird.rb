class Bird
  attr_accessor :feathers

  def initialize(options = {})
    @feathers = options[:feathers] || rand(1..100)
  end

  def preen
    puts "I am cleaning my feathers."
  end

  def fly
    puts "I am flying."
  end
end
class Penguin < Bird
end