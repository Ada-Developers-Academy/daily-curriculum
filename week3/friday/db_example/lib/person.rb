require 'sqlite3'
$db = SQLite3::Database.new('db_example')
# CREATE THE `people` TABLE

class Person
  attr_accessor :id, :name
  
  
  def initialize(attrs_array=[])
    @id   = attrs_array[0]
    @name = attrs_array[1]
  end
  
  def self.find(id)
    data = $db.execute("select * from people WHERE id = #{id} LIMIT 1")
    Person.new(data.first)
  end
  
  def self.all
    $db.execute("select * from people")
  end
  
  def self.create(attrs={})
    data = $db.execute('INSERT INTO people (name, age, gender, job) VALUES ("Bookis", 25, "Male", "boy")')
    puts data.inspect
    Person.new
  end
  
end