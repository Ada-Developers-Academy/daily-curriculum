require "./lib/dice"

describe Dice do

  it "should create new dice" do
    expect(Dice.new).not_to eq nil
  end

  it "should allow a user to roll a single die" do
    expect(Dice.new.roll).to be_a Array
  end

  it "should allow a user to roll multiple dice" do
    dice = Dice.new
    dice.roll(5)

    expect(dice.roll(5)).to        be_a Array
    expect(dice.roll(5).length).to eq 5
  end

  it "should return a number between 1 and 6" do
    dice = Dice.new

    dice.roll(5).each do |value|
      expect(value).to be_between(1,6)
    end
  end

  it "#values should not change unless #roll is called" do
    dice = Dice.new
    dice.roll(5)

    first_time  = dice.values
    second_time = dice.values

    expect(second_time).to eq first_time
  end

  it "#values should change between each roll" do
    dice = Dice.new
    dice.roll(5)
    first_time = dice.values

    dice.roll(5)
    second_time = dice.values

    expect(second_time).not_to eq first_time

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  it "should allow a user to roll different numbers of dice" do
    dice = Dice.new

    expect(dice.roll.length).to eq 1
    expect(dice.roll(3).length).to eq 3
    expect(dice.roll(5).length).to eq 5
  end
end