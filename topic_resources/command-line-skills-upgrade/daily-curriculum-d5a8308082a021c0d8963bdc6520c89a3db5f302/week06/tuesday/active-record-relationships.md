# Active Record Relationships

Just like in FarMar finder two class can be associated to each other through an identifier
field. If we have two records like the following

**Market**

|ID|Name|
|:----:|:-----:|
|1| Cap Hill Market|
**Vendor**

|ID|Name|Market ID|
|:----:|:-----:|:---:|
|1| Jules Produce|1|
|2| Verne's Flowers|1|

We would call this a one-to-many (has many) association. Where the Market has many vendors.
And each vendor belongs to a market. The Market_id column for a vendor corresponds to the ID
on a market object.

Defining an Association
-----------------------

Rails gives us magic to easily create an association between two (or more!) models.
We can use class methods within the models to make the definition.

```ruby
class Post < ActiveRecord::Base
  has_many :comments
end
```
```ruby
class Comment < ActiveRecord::Base
  belongs_to :post
end
```

The `Comment` class would need a `post_id` column to store the ID of the associated `Post`.
To create this model we can use the rails g command:

```bash
rails g model comment content:text post_id:integer
```

Having an association adds a group of methods specifically for querying the associated model.

**belongs_to**

- `post`
- `post=(post_object)`
- `build_post(post_attributes)`
- `create_post(post_attributes)`
- `create_post!(post_attributes)`

**has_many**

- `comments`
- `comments << (comment_object)`
- `comments=(comment_collection)`
- `comments.find(id)`
- `comments.where(conditions)`
- `comments.build(comment_attributes)`
- `comments.create(comment_attributes)`
- `comments.create!(comment_attributes)`
