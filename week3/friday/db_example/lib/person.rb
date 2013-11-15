require 'sqlite3'
$db = SQLite3::Database.new('db_example')
$db.results_as_hash = true
# CREATE THE `people` TABLE

class Person
  attr_accessor :id, :name
  
  
  def initialize(attrs_array=[])
    @id   = attrs_array["id"]
    @name = attrs_array["name"]
  end
  
  def self.find(id)
    data = $db.execute("select * from people WHERE id = #{id} LIMIT 1")
    Person.new(data.first)
  end
  
  def self.all
    $db.execute("select * from people")
  end
  
  def self.last
    $db.execute("select * from people").last
  end
  
  def self.create(attrs={})
    $db.execute('INSERT INTO people (name, age, gender, job) VALUES ("Bookis", 25, "Male", "boy")')
    Person.new(last)
  end
  
end