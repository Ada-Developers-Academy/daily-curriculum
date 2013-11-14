require 'sqlite3'
$db = SQLite3::Database.new('db_example')
# CREATE THE `people` TABLE

class Person
  
  def self.all
    $db.execute("select * from people")
  end
  
  def self.create(attrs={})
    $db.execute('INSERT INTO people (name, age, gender, job) VALUES ("Bookis", 25, "Male", "boy")')
  end
  
end