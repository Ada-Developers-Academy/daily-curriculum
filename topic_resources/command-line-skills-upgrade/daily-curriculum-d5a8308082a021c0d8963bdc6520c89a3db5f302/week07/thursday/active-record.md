## ActiveRecord

In this lesson we are going to explore the syntax and usage of active record with Rails models. All rails models inherit from `ActiveRecord::Base`, this give us **many** functions, but the core function it gives us is the ability to interact with any kind of SQL DB without actually writing SQL.

This lesson assumes you have a Rails application with the model `Order` with attributes `total:integer`, `status:string`, `address_id:integer`, `checkout_time:datetime`, and `customer_name:string`.

#### After this lesson you should be able to:

- Load and use `rails console`
- Query for a single row in the DB
- Query for multiple rows in the DB
- Create rows in the DB
- Delete rows from the DB
- Update rows in the DB
- Extending Active Record queries with `scope`

#### Creating DB rows (records) with ActiveRecord (a model)

For this lesson we will use the console to try out the active record methods. Rails console is `irb` with our entire rails app loaded and connected to the database (the same database as our webserver). To enter rails console, in the terminal

    rails console
    
First we will look at the syntax for creating records in the database. There two main methods to accomplish this:

- `Order.new`
- `Order.create`

`Order.new` initiates an object, but doesn't actually save it to the database. To save the object to the database we would call the `.save` method on the object

    order = Order.new
    order.save # => writes a new record to the db
    
`Order.create` does the equivalent of `Order.new.save`

    order = Order.create # => writes a new record to the db

Typically we would want to pass in attributes to be saved with this object, we do this through an options hash.

    order = Order.new(total: 9000, status: "pending", customer_name: "Bookis Smuin")
    order.save
    
After `order.save` we will see the output the indicates the record was saved in the db

    begin transaction
      SQL (12.9ms)  INSERT INTO "orders" ("created_at", "customer_name", "status", "total", "updated_at") VALUES (?, ?, ?, ?, ?)  [["created_at", Thu, 12 Dec 2013 16:17:36 UTC +00:00], ["customer_name", "Bookis Smuin"], ["status", "pending"], ["total", 9000], ["updated_at", Thu, 12 Dec 2013 16:17:36 UTC +00:00]]
       (0.9ms)  commit transaction
       
The same method could have been used with `create`

    order = Order.create(total: 9000, status: "pending", customer_name: "Bookis Smuin")
    
So when to use `new` or `create`? There are many times that you may want to new object without saving it the database quite yet, for instance if we need to build the attributes over time.

    order = Order.new
    order.total = 9000
    order.customer_name = "Bookis Smuin"
    order.status = "paid"
    order.checkout_time = Time.now
    order.save
    
Or if we want to use a conditional statement during the save of the order

    order = Order.new
    if order.save
      # do something
    else
      # do something else
    end
    

#### Querying

Rails model provide over 20 methods to query for db records. Some commonly used methods are:

- find
- where
- find_by
- includes
- limit
- none
- order
- uniq

The two most important we will be looking at are `find`, `find_by`, and `where`.

First we'll look at `find` and `find_by`. `find` is the most basic query method, it takes one argument, it is expected to be an integer, it will find the record in the db with the `id` that matches the argument.

    Order.find(1)
    
Generates the SQL

    SELECT "orders".* FROM "orders" WHERE "orders"."id" = ? LIMIT 1  [["id", 1]]
    
This returns a single `Order` object where id == 1. Since all records within a table have a unique id field, this is a great way to find a very specific and unique record.

Next is `find_by`, this is similar to `find` but allows us to signify which column we want to find by instead of id. `find_by` also takes 1 argument, but this argument is actually a hash of keys and values:

    Order.find_by(customer_name: "Bookis Smuin")
    
This returns the first record found in the db where the `customer_name` field matches `"Bookis Smuin"`. We can use any field and even put in multiple key/value pairs to find across many fields.

    order = Order.find_by(status: "pending")
    order = Order.find_by(status: "pending", customer_name: "Bookis Smuin")
    
The last query looks for the first record in the db where `status` matches `"pending"` **and** `customer_name` matches `"Bookis Smuin"`.
    
Next we'll look at the `where` method. `where` is similar to `find_by` except it will find **all** of the records that match our conditions, not just the first one. The results will be returned in an array*.

    orders = Order.where(status: "pending")
    orders.count # => 2
    orders.first.customer_name # => "Bookis Smuin"
    
We can also give multiple key/value pairs in the argument to find accross many fields:

    orders = Order.where(status: "pending", price: 9000)
    
Will find all of the records wher the `status` matches `"pending"` and the `price` is `9000`.

#### Deleting rows from the DB

We can delete rows from the db using the `destroy` method. This method is called on a single instance of the model.

    order = Order.find(1)
    order.destroy
    Order.find(1) # => raises an error because this record no longer exists

    
#### Updating rows in the db

We can update the values in the db using the `update` method, again this is a method called on an single instance of the model. The `update` method takes one argument, which is a hash just like the `new` and `create` methods.

    order = Order.find(2)
    order.update(status: "complete")
    Order.where(status: "complete") # This query will contain order
    
And we can pass in multiple key/value pairs

    order = Order.find(2)
    order.update(status: "canceled", total: 0, checkout_time: nil)
    
All three of these fields will be updated in the db. Any field we put in don't put in the options has will not change.

#### Scopes

`scope` is used to create a named method that executes a certain query. For instance if we wanted to find all of the records with the `status` of `"pending"`, we would use the `where` method

    Order.where(status: "pending")
    
Say we wanted to use this method **a lot**, we could create a `scope` for it. In the `models/order.rb` file add a scope:

    class Order < ActiveRecord::Base
      scope :pending, -> { where(status: "pending") }
    end

This looks a bit confusing, to break it down. The word `scope` says we're defining a new scope, `:pending` is the name we are giving the scope, and everything in `{ }` is the query we want to do.

Adding this scope gives our `Order` model the class method of `pending`

    Order.pending # executes the query within the { }
    



