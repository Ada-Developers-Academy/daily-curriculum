require 'person'

describe Person do
  describe "database" do
    it "should return an instance of a db" do
      $db.should be_a SQLite3::Database
    end
  end
  
  describe "find methods" do
    it "finds all of the people" do
      $db.execute("")
      Person.all.count.should eq 1
    end
  end
  
  describe "create" do
    it "should create a new person" do
      expect {Person.create}.to change(Person, :count).by(1)
    end
  end
end