require 'sqlite3'
$db = SQLite3::Database.new('db_example')
# CREATE THE `people` TABLE

class Person
  
  def self.all
    $db.execute("select * from people")
  end
  
end