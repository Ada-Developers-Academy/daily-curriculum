# Active Record Associations

**Recipe**

|ID|Name|
|:----:|:-----:|
|1     | Orange Marmalade|
|2     | Orange Juice    |

**Ingredient**

|ID|Name|recipe_id|
|:----:|:-----:|:---:|
|1| Fresh Oranges  |1|
|2| Sugar |1|

We would call this a one-to-many (has many) association. Where the Market has many vendors.
And each vendor belongs to a market. The Market_id column for a vendor corresponds to the ID
on a market object.

But in this case it's more likely that we want a many-to-many, where "Fresh Oranges" can have many recipes, and many recipes can have "Fresh Oranges". For this we need to add a join table. A join table is simply a table that belongs to two other tables. It's possible to have additional information within the join table. For this purpose we would not want the `recipe_id` on the `Ingredient` model, because an ingredient is now going to be able to belong to many recipes.

**Recipe**

|ID|Name|
|:----:|:-----:|
|1     | Orange Marmalade|
|2     | Orange Juice    |

**Ingredient**

|ID|Name|
|:----:|:-----:|:---:|
|1| Fresh Oranges  |
|2| Sugar |

**RecipeIngredient**

|ID|recipe_id|ingredient_id|
|:----:|:-----:|:---:|:---:|
|1| 1|1|
|2| 1|2|
|2| 2|2|



Defining an Association
-----------------------

Rails gives us magic to easily create an association between two (or more!) models.
We can use class methods within the models to make the definition.

```ruby
class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
```
```ruby
class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
```
```ruby
class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
```

Having an association adds a group of methods specifically for querying the associated model.

**belongs_to**

- `recipe`
- `recipe=(recipe_object)`
- `build_recipe(recipe_attributes)`
- `create_recipe(recipe_attributes)`
- `create_recipe!(recipe_attributes)`

**has_many**

- `ingredients`
- `ingredients << ingredient_object`
- `ingredients=(ingredient_collection)`
- `ingredients.find(id)`
- `ingredients.where(conditions)`
- `ingredients.build(ingredient_attributes)`
- `ingredients.create(ingredient_attributes)`
- `ingredients.create!(ingredient_attributes)`

Querying
--------

.where
--------
`.where` is used to query and return **all** rows matching given conditions. The object returned is an `ActiveRecord::Relation`

```ruby
Ingredient.where(name: "Fresh Oranges")
# => Returns all Ingredients where the name is "Fresh Oranges"

Ingredient.where(name: "Fresh Oranges", description: "They're orange!")
# => Returns all Ingredients where the name is "Fresh Oranges" AND the description is "They're orange!"

Ingredient.where("name = ? OR description = ?", "Fresh Oranges", "They're orange!")
# => Returns all Ingredients where the name is "Fresh Oranges" OR the description is "They're orange!"


Ingredient.where("name ILIKE ?", "%orange%")
# => Returns all Ingredients where the name contains "oranges" ignoring case.

```

.find_by
--------
`.find_by` works just like where, except it returns a single instance which matches the condition.

.order
--------
`.order` is used to order the rows in the database.

```ruby
Recipe.order("name asc")
# => returns all recipe objects ordered by the name attribute in ascending order
```

.sum
--------
Sums a database column.

```ruby
Order.sum(:total)
# => Returns the values from all rows summed into a single value.
```

.includes
--------
Preloads an additional database table by association.
```ruby
Order.includes(:order_items)
# => Loads the database 'order_items' table.
```

ActiveRecord::Relation
----------------------
