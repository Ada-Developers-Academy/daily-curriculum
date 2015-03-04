# Revisiting Classes

We are going to recap the following four ideas within classes:

- Constructor
- Instance Methods
- Class Methods
- Attributes (stored in instance variables)

Constructor (`initialize`)
--------------

The `initialize` method within a class is special, when the `new` method is called on a class a new instance is instantiated and the `initialize` method is promptly called on it. This method is used to setup the default state of an object
Typically within a `initialize` method we set any given attributes and make any data manipulations that we need to

```ruby
class Product
  def initialize(name, price)
    @name  = name.capitalize
    @price = price
    activate!
  end

  def activate!
    @status = :for_sale
  end
end
```

Instance Methods
---------------

Instance methods are defined with `def a_snake_case_word`. Instance methods are only available on instances of a class.

```ruby
class Order

  def initialize(subtotal, quantity)
    @subtotal = subtotal
    @quantity = quantity
  end

  def total
    @subtotal * @quantity
  end

  def to_money
    "$#{sprintf("%0.02f", total / 100)}"
  end

end

order = Order.new(1000, 2)
order.to_money
```

Class Methods
------------

Class methods are defined like instance methods, but they start with `self.`, `def self.make_row`

```ruby
class Pawn
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    ("a".."h").collect do |letter|
      new("#{letter}#{num}")
    end
  end
end
Pawn.make_row("black")
```

Attributes
----------

Attributes are really just instance variables. But Ruby provides a couple of methods to help us get and set these instance variables.

```ruby
class Coordinate
  attr_accessor :x, :y

  # attr_accessor does the exact same as the four methods below
  # ----------------------------------------------------

  def x
    @x
  end

  def x=(new_x)
    @x = new_x
  end

  def y
    @y
  end

  def y=(new_y)
    @y
  end

end
```

`attr_accessor` defines methods to get and set an instance variable as the same name as the symbol we give it.
