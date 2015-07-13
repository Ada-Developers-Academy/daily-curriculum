# User Authentication

It's extremely common in a web application to have users, and with users comes
the responsibility of authenticating the user, typically via a password matched
with their email or username.

The real challenge is keeping this information secure. The user is trusting you
with their password. You need to be responsible with that information.

**What is the absolute safest way to keep data secure?**

Bcrypt
-------
Bcrypt is an algorithm created in 1999. The algorithm takes some type of user input
and creates gibberish out of it.

```ruby
require 'bcrypt'
BCrypt::Password.create("some user input")
# => "$2a$10$2.HBQHXv8JOOKPj.AZqnm.1vXe7BLsdEvz1ncBShGtkm4v8lMDKG2"
```

Here we used the `BCrypt` ruby gem to turn the input `some user input` into gibberish.
This process is called hashing, similar to encoding or encryption, except hashing cannot be undone.

This is the key to the solution of not storing the users data. If we use hashing
to create gibberish out of a users password and store that gibberish, then not only are we
not storing their password, but since hashing is not reversible, even we as website owners
have no way of determining what their password originally was.

If the data we are storing is not reversible, how do we use it to authenticate the user?
When the user puts their password in again (sign in) we can recreate the same gibberish and compare the two.

```ruby
hashed_password = BCrypt::Password.create("some user input")
# => "$2a$10$2.HBQHXv8JOOKPj.AZqnm.1vXe7BLsdEvz1ncBShGtkm4v8lMDKG2"
hashed_password == "some user input"
# => true
```

has_secure_password
-------------------

`has_secure_password` is built into Rails to utilize bcrypt in the exact way described above.
simply adding the line `has_secure_password` to any active record model (typically a `User`).
The `has_secure_password` functionality depends on the model having a column in the DB called `password_digest`

```bash
rails g model User username:string email:string password_digest:string
```

```ruby
class User < ActiveRecord::Base
  has_secure_password
end
```

The `password_digest` is the column which rails will save the gibberish created by bcrypt.

The `has_secure_password` gives us the functionality to create the gibberish in a concise way.

```ruby
user = User.new
user.password = "mypassword"
user.password_confirmation = "mypassword"
```

We are given these two methods `password=` and `password_confirmation=`, these two fields
are **not** stored in the database, they are only "virtual" attributes (just like regular ruby object, before we saved stuff to the database)

`has_secure_password` adds validations to the user, so if the password and password_confirmation do not match
the user will be invalid, so it will not save, nor will it create the `password_digest`.

```ruby
user = User.new(username: "Ada")
user.password = "password"
user.password_confirmation = "wrong_password"
user.save # => false
user.errors
# => {password_confirmation: ["doesn't match Password"]}
user.password_confirmation = "password"
user.save
user.password_digest
# => "$2a$10$qbOPN4cu5j5OxXmZ.1hNOOdXqnafGsCA5ptTlscFQtMkg0xH./oxq"
```

Now that the user object has a saved `password_digest`, we can check if a new input
given matches the hash, Rails gives a method to do this in an easy way.

```ruby
user = User.find_by(username: "Ada")
user.authenticate("wrong_password") # => false
user.authenticate("password")
# => returns user object itself if true
```
