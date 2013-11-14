require "./lib/person"

describe Person do
  
  it "is an example" do
    true.should eq true
  end
  
  it "has the assigned through new" do
    Person.new("Bookis").name.should eq "Bookis"
  end
end