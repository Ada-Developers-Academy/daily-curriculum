class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

require 'rspec'

describe "Person" do
  let(:person) { Person.new("Bookis") }
  it "has the name Bookis" do
    person.name.should eq "Bookis"
  end
end
# Run with `rspec filename.rb`