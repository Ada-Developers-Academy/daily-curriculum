MongoDB
-------

By internet standards, MongoDB is a venerable NoSQL database. First introduced in 2009, it was designed as a scalable document storage engine. In Mongo, we don't work with tables and rows, we work with **collections** and **documents**. Documents contain JSON/BSON hashes, so any data that can be represented as a hash can be stored in Mongo. Mongo is a **schemaless** database, meaning there's no requirements nor enforcement about the structure of the data in a document.

Mongo is able to handle massive data sets quickly and efficiently, and is used by many big data organizations, including Foursquare, bit.ly, and CERN for collecting Large Hadron Collider data.

## Installation

This is fairly straight forward using homebrew.

```
brew install mongodb
```

When it finishes, it will print out some information on setting up Mongo to start whenever you start your computer. I'm not a huge fan of that. Here's what I use:

```
brew services start mongodb
```

..and to stop it:

```
brew services stop mongodb
```


## Mongo and Rails

Let's make a new Rails application, but specify that we do NOT want Active Record installed.

```
rails new mongo-people --skip-active-record
```

`cd` into the project, and edit the Gemfile, add this line:

```
gem "mongoid", git: 'git://github.com/mongoid/mongoid.git'
```

Save, and then run 

```
bundle install
```

Just as when using a relational DB such as SQLite, Postgres, or MySQL, we need a configuration file. Mongoid installs a custom Rails generator for us. Run:

```
rails generate mongoid:config
```

Open up the file it creates, located at `config/mongoid.yml` and take a look. Take note of the different options we *could* configure. Don't make any changes at this time; its enough to just take a look at what the generator created on our behalf.

At this point, I like to run `rails s` and make sure the server starts, that everything is all hunkey-dorey. Once you've checked in a browser that Rails is at least starting up correctly, let's make a new git repo and check in what we've got so far.

Let's get started. Since this is a demonstration, let's cheat a little bit and use Rails' scaffolding generators to get us started.

```
rails generate scaffold person name street city state
```

Use `git status` to see what the command generated. It should all look pretty normal.. but let's take a look at the model it generated.

```ruby
class Person
  include Mongoid::Document
  field :name, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
end
```

Quite different! Mongo doesn't have a database schema, so no database migrations are needed. If we want a new field, we could just declare one in the model and add it to our views. Migrations are occasionally used, but they're for data migration or transformation, not changing the structure of the database.

Let's fire up our Rails server and visit the scaffolded route (at ```http://localhost:3000/people```) There we see the vanilla Rails CRUD forms. Let's add a person.. and look at the URL in the show page - weird! We're used to seeing incrementing IDs created for us by the database. Each row that is added to the table increments the row counter by exactly 1, so we might say that each row has a locally unique sequential identifier.

MongoDB uses these weird looking hashes of alphanumerics like "532e2ba7546f6c30aa000000". This **Object ID** is always 12 bytes, composed of a timestamp, client machine id, client process id, and a 3-byte incremented counter. 

>**Q:Why might this be useful?**


## Documents

Let's take a look at what a document looks like.

You may have seen command line interfaces for PostgreSQL, so it shouldn't come as a shock that MongoDB offers one as well. In a terminal window:

```
mongo mongo_people_development
```

Note that I found the name of our database by looking at `config/mongoid.yml`.

Mongo uses its own special command language for working with its data. If you get stuck, just type `help`.

First, let's take a look at the collections in this database.
```
>show collections
people
system.indexes
>
```

To find a record, the format is `db.[collection].find()`

```
> db.people.find()
{ "_id" : ObjectId("532e2ba7546f6c30aa000000"), "name" : "Kerri Miller", "street" : "123 Main Street", "city" : "SEATTLE", "state" : "WA" }
> db.people.find({"state":"WA"})
{ "_id" : ObjectId("532e2ba7546f6c30aa000000"), "name" : "Kerri Miller", "street" : "123 Main Street", "city" : "SEATTLE", "state" : "WA" }
>
```

Note that the first command returned ALL documents in the collection, we just happened to only have one document, so that's all that was returned.

Remember when I said that MongoDB stores everything as JSON? Mongo actually uses JavaScript here in the command line.

```
> typeof db
object
> typeof db.people
object
> typeof db.people.find 
> function
>
```

If we want to see what the code for a Mongo command looks like, we can call the function without parenthesis.

```javascript
> db.people.find
function ( query , fields , limit , skip, batchSize, options ){
    var cursor = new DBQuery( this._mongo , this._db , this ,
                        this._fullName , this._massageObject( query ) , fields , limit , skip , batchSize , options || this.getQueryOptions() );

    var connObj = this.getMongo();
    var readPrefMode = connObj.getReadPrefMode();
    if (readPrefMode != null) {
        cursor.readPref(readPrefMode, connObj.getReadPrefTagSet());
    }

    return cursor;
}
>
```

## Wrapping Up
### Why Mongo?
Mongo is designed to be highly-scalable and flexible, but remain familiar enough that application developers could use it easily. Working with Mongo is mostly the same as working with a traditional RDBMS (except for being unable to do server-side JOINs between two sets of data..)

Because it can't do server-side JOINs, the relationships between different objects (Users have Posts, Posts have Comments, Comments have Users) can be tricky, as you need to set up those relationships in the model.

### Why not Mongo?
How Mongo encourages denormalization of schemas (by not having any) might be a little too much for some to swallow. Some developers find the cold, hard constraints of a relational database reassuring.

Although sometimes restrictive, a database schema and the restraints it places on our data can be reassuring and useful. While Mongo offers a huge increase in scalability and speed of record retrieval, its inability to relate documents from 2 different collections -- the key strength of a RDBMS -- makes it often not the best case for a CRUD-focused web application.

Because Mongo is focused on large datasets, it works best in large clusters, which can be a pain to design and manage.

## Resources

**Why I think Mongo is to Databases what Rails was to Frameworks**

Meaty blog post from John Nunemaker on why you should use MongoDB
http://www.railstips.org/blog/archives/2009/12/18/why-i-think-mongo-is-to-databases-what-rails-was-to-frameworks/


**Why you should never use MongoDB**

Lengthy blog post by Sarah Mei on the Discourse project's use of MongoDB, and why they ultimately migrated to PostgreSQL. The comments are actually worth reading.
http://www.sarahmei.com/blog/2013/11/11/why-you-should-never-use-mongodb/


**Mongoid Gem**

Good documentation about working with MongoDB from a Ruby and RoR perspective
http://mongoid.org/en/mongoid/


**Railscast on Mongoid**

http://railscasts.com/episodes/238-mongoid


**Railscast on MongoDB**

This one is a bit dated but worth a read-through.
http://railscasts.com/episodes/194-mongodb-and-mongomapper


**Devise with Mondoid**

http://railsapps.github.io/tutorial-rails-mongoid-devise.html


