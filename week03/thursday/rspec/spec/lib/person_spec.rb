require "./lib/person"

describe Person do
  describe "new" do
    it "has the assigned name through the new method" do
      Person.new("Bookis").name.should eq "Bookis"
    end

    it "assigns the name attribute from a hash" do
      expect(Person.new({:name => "Bookis"}).name).to eq "Bookis"
    end
  end
  
  it "is an example" do
    true.should eq true
  end
  
end