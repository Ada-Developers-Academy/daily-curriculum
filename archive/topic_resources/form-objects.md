# Form Objects

**Design Patterns**

> In software engineering, a design pattern is a general reusable solution to a commonly occurring problem within a given context in software design.

There are tons of defined [design patterns](http://en.wikipedia.org/wiki/Software_design_pattern). In short they are documented solutions for common problems. For example, a common problem is that we need to perform the same action on a collection of objects. A common pattern for solving this problem is using iteration. This is the solution regardless of language.

In ruby many design patterns are implemented as simple ruby classes.

Form Objects
------------

Form objects (or presenter pattern) is a design pattern to solve the common problem of having one input meant to instantiate multiple models. For example, if we want to be able to create a recipe, ingredients, and recipe ingredients all from one form. This logic doesn't really fit inside of any individual model, because creating ingredients shouldn't be the responsibility of recipes. A form object should:

- Initialize with a set of attributes
- Have a method that attempts to create/save each of the models.
- Determine if the save was successful

Optionally:

- Form specific validations (sign up has different validations that don't apply to the other forms)
- Handling error messages for the form.

Testing
-------
Form objects are a great example of something to unit test with rspec. To get started in creating the class and specs

```bash
mkdir app/forms
touch app/forms/recipe_form.rb

mkdir spec/forms
touch spec/forms/recipe_form_spec.rb
```

```ruby
# app/forms/recipe_form.rb

class RecipeForm
  #code goes here
end
```

```ruby
require "rails_helper"

describe RecipeForm do
  # tests go here
end
```

Now running rspec will automatically pick up this spec file.

If your rails server is running, you'll need to restart it for it to recognize the new forms directory.
