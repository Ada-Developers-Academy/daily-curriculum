require 'person'

describe Person do
  before { $db.execute('DELETE FROM people') }
  describe "database" do
    it "should return an instance of a db" do
      $db.should be_a SQLite3::Database
    end
  end
  
  describe "find methods" do
    it "finds all of the people" do
      $db.execute('INSERT INTO people (name, age, gender, job) VALUES ("Bookis", 25, "Male", "boy")')
      Person.all.count.should eq 1
    end
  end
  
  describe "create" do
    it "should create a new person" do
      expect {Person.create}.to change(Person.all, :count).by(1)
    end
  end
end