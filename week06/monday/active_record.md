!SLIDE title-and-content transition=fade

Active Record
=============

Active Record is an  **Object Relational Mapping** technique. It is used to abstract and simplify the connection between your code and a database.


!SLIDE title-and-content transition=fade

Active Record Models
====================

So far we've created models like so:

```ruby
class Student

end
```

!SLIDE title-and-content text-size-80 transition=fade

Active Record Models
====================

To work with a database, we have to manually set up the connection. Something like this, perhaps?

```ruby
class Student
  require 'sequel'

  def initialize
    @db = Sequel.connect('sqlite://todo.db')
  end

  def self.all
    @todoings = @db[:todoings]
  end
end
```
What are some problems with this approach?


!SLIDE title-and-content text-size-90 transition=fade

Generating New AR Models
========================
Active Record can set up the connections for us!

<pre>
$ rails generate model student name:string class:string birthday:datetime
</pre>


!SLIDE title-and-content text-size-80 transition=fade

Active Record Models
====================

```ruby
class Student << ActiveRecord::Base

end
```

This will create a Student model, mapped to a students table at the database. By doing this you'll also have the ability to map the columns of each row in that table with the attributes of the instances of your model. 

!SLIDE title-and-content text-size-80 transition=fade

Active Record Migrations
========================

First let's talk briefly about migrations.


!SLIDE title-and-content text-size-80 transition=fade

Active Record Migrations
========================

<pre>
$ rake db:migrate
</pre>


!SLIDE title-and-content transition=fade

Active Record as a DSL
======================

Given a table in our database called "students" that has this structure:

| id | name  | class       | birthday   |
|:--:|:-----:|:-----------:|:----------:|
|  1 | Mary  | Fall 2013   | 11-13-1984 |
|  2 | Sally | Fall 2013   | 08-11-1979 |
|  3 | Alice | Spring 2014 | 03-27-1990 |


!SLIDE title-and-content transition=fade

Active Record as a DSL
======================

```ruby
s = Student.new
s.name = "Libby"
puts s.name # "Libby"
```

!SLIDE title-and-content transition=fade

Active Record as a DSL
======================

ActiveRecord also adds class methods for reading records from the database

```ruby
# return a collection with all students
students = Student.all
# return the first student
student = Student.first
# return the first student named David
melissa = Student.find_by(name: 'Melissa')
```


!SLIDE title-and-content transition=fade

Active Record as a DSL
======================

It behaves like any other Ruby code, so we can chain methods together to create more complex queries.

<pre>
Student.where(class: "Fall 2013").order(birthday:  :desc)
</pre>

This finds all the records in our students table *where* class is "Fall 2013" and *orders* them by their birthdays, from youngest to newest (descending).


!SLIDE text-size-80 title-and-content transition=fade

What's it doing?
================

The Active Record DSL translates our Ruby code into SQL - similar to what you built in the FarMar Finder app.
<pre>
Student.where(class: "Fall 2013").order('birthday DESC')
</pre>

becomes

<pre>
SELECT * FROM 'students' WHERE class = "Fall 2013" ORDER BY birthday DESC
</pre>


!SLIDE text-size-90 title-and-content transition=fade

Active Record as a DSL
======================

Active Record objects can be created from a hash, a block or have their attributes manually set after creation. **.new** returns a new object of that class, but doesn't save it to the database.

```ruby
Student.new(name: "Cassie", class: "Spring 2014")
```

```ruby
student = Student.new
student.name = "Cassie"
student.class = "Spring 2014"
```


!SLIDE text-size-80 title-and-content transition=fade

Active Record as a DSL
======================

Meanwhile, **.create** will return the object *and* save it to the database.

```ruby
Student.create(name: "Cassie", class: "Spring 2014")
```


!SLIDE text-size-90 title-and-content transition=fade

What Did We Learn?
==================
+ Active Record is an ORM, and provides a DSL for building queries
+ We touched briefly on how to create an Active Record model and migration
+ Some basic CRUD queries using Active Record


!SLIDE text-size-90 title-and-content transition=fade

Other Resources
===============
http://guides.rubyonrails.org/active_record_basics.html
http://guides.rubyonrails.org/migrations.html
http://guides.rubyonrails.org/active_record_querying.html
http://railsforzombies.org/


