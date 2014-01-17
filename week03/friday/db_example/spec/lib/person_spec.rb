require 'person'

describe Person do
  before { $db.execute('DELETE FROM people') }
  describe "database" do
    it "should return an instance of a db" do
      $db.should be_a SQLite3::Database
    end
  end
  
  describe "#all" do
    it "finds one person" do
      $db.execute('INSERT INTO people (name, age, gender, job) VALUES ("Bookis", 25, "Male", "boy")')
      Person.all.count.should eq 1
    end
  end
  
  describe "find" do
    let(:person) { Person.create(name: "Bookis") }
    it "finds the person with id 1" do
      person
      Person.find(1).id.should eq 1
    end
  end
  
  describe "create" do
    let(:person) { Person.create(name: "Bookis") }
    it "should create a new person" do
      person
      Person.all.count.should eq 1
    end
    
    it "returns a person object" do
      person.should be_a Person
    end
    
    it "should assign the name" do
      person.name.should eq "Bookis"
    end
  end
end