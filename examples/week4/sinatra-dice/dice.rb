# Implement a Dice Class here:
#
class Dice
  attr_reader :values

  def roll(number_to_roll = 1)
    @values = []

    number_to_roll.times { @values << rand(1..6) }

    @values
    (1..10).times

    end
  end
end

