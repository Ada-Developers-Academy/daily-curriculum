# Validations

Rails gives us an easy way to validate data before it goes into the database.

Why would we want to validate data? If we receive input from a user that doesn't match
what is required for our application to run, we want to halt the process and re ask
for the input until it is correct.

If our application depends on a user having an email address (to show on the html page and/or to send emails)
You want to ensure they provide an email address to sign up.

In an ActiveRecord model we can use the `validates` method to add requirements.
The `validates` method takes two types of arguments, first is the field name to
validate (`:email`), next is the way in which we want to validate it (`presence: true`)

```ruby
class User < ActiveRecord::Base
  validates :email, presence: true
end
```

There are many validations helpers (like `presence`) the most common are

- :uniqueness (ensures the field doesn't already exist in the db)
- :format (uses a regular expression to ensure a match)
- :length (ensures text is within a given range)
- :numericality (ensures the value is a number)

Each of the helpers takes additional options.

```ruby
class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: {with: /@/}
  validates :username, uniqueness: true
  validates :username, length: {greater_than: 1, less_than: 100}
  validates :age, numericality: true
  # validates :age, numericality: {only_integer: true}
end
```

Error Messages
--------------

When there is a failed validation. ActiveRecord keeps track of which column(s)
caused the failure. ActiveRecord models have a "virtual" attribute called `errors`.
This `errors` attribute is a hash of error messages. By default it is empty, but
when a record is validated and fails this hash is updated with error messages about each failure.

```ruby
user = User.new(title: nil)
user.errors # => {}, it's empty because the validations haven't run yet.
user.save # validations run when a save is attempted.
user.errors {title: ["can't be blank"]}
```

Since each column could have multiple validations (email must be present and match a regex)
the value associated with a column is an Array of error messages

Showing Error Messages
----------------------
In an erb file with a form

```html
<h2>New Post</h2>

<ul>
  <% @post.errors.each do |column, message| %>
    <li>
      <strong><%= column.capitalize %></strong> <%= message %>
    </li>
  <% end %>
</ul>

<form action="/posts" method="POST">
  Title
  <input type="text" name="post[name]" value="<%= @post.title %>" />
  Content
  <input type="text" name="post[content]" value="<%= @post.content %>" />

  <input type="submit"/>
</form>
```

Resources
---------
[Rails Guide to Validations](http://guides.rubyonrails.org/active_record_validations.html)
