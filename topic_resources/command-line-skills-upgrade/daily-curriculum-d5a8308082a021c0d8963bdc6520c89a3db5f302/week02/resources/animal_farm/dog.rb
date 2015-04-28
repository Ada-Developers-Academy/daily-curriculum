class Dog
  attr_accessor :breed

  def initialize(options = {})
    @breed = options[:breed] || "Mutt"
  end
end

























class Lab < Dog
  attr_accessor :name

  def initialize(options = {})
    super(options)
    @name = options[:name]
  end
end