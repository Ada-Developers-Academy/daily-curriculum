# Ada Cooks!
The goal of this project is to build an online cookbook application where users can manage Recipes and Ingredients, create Cookbook collections of different Recipes, and keep track of their Ingredients.

## Learning Goals
- Explore advanced ActiveRecord relationships like `has_many through:` and `has_and_belongs_to_many`.
- Explore controlling access to functionality based on User state and/or role.
- Explore working with image uploads with [CarrierWave](https://github.com/carrierwaveuploader/carrierwave).
- Explore object factories using [factory_girl](https://github.com/thoughtbot/factory_girl_rails) as a means of simplifying object setup in tests.

## Project Baseline
We are going to try something new with this project. When you've accomplished all of the baseline requirements, please issue a PR back to the project master. We will review and merge your baseline, but you don't need to wait for that to happen before helping your classmates and moving onto the project requirements.

We're doing this to make the final project easier to code review. Because the baseline includes all of the Rails setup and boilerplate, issuing (and merging) a PR at the beginning will remove those files from the Pull Request interface for the PR you'll open at the end of the project.

### The baseline requirements are...
- a ruby-gemset and ruby-version.
- a new rails 4.2.2 application.
- [rspec](https://github.com/rspec/rspec-rails) setup in document format (hint: use a .rspec config file and the `rspec_rails` gem)
- [factory_girl](https://github.com/thoughtbot/factory_girl_rails) included and set up to work with rspec (hint: use the `factory_girl_rails` gem)
- code coverage reporting (hint: user simplecov)

## User Stories

### As any User, I can...
- search by the name of an Ingredient and get related Recipes back.
- __Recipes__
  - view an alphabetical list of all Recipes
  - view the details of a Recipe, inluding...
    - a link to the User profile of the person who created the Recipe
    - links to the Ingridient profile for all associated Ingredients
- __Ingredients__
  - view an alphabetical list of all Ingedients
  - view the details of an individual Ingredient, including...
    - a list of links to Recipes associated with the Ingredient
    
### As an anonymous User I can...
- register a new User account
- Log In to an existing User account

### As a Logged In User I can...
- Log Out
- __Cookbooks__
  - See a list of Cookbooks I've already created, including...
    - The number of Recipes associated with the Cookbook
    - The number of unique Recipes associated with the Cookbook
  - See the details of a specific Cookbook, including...
    - a list of links to the Recipes associated with the Cookbook
    - a link to remove (unassociate) a Recipe from the Cookbook. This does not destroy the Recipe.
  - Create a new Cookbook, associated with my User account, with...
    - a `name` (required)
    - a `description` (optional)
  - Destroy an existing Cookbook
    - Destroying a Cookbook __does not__ destroy the Recipes, just the associations.
  - Edit an existing Cookbook's `name` and `description` information.
- __Recipes__
  - Create a new Recipe, optionally associated with one of my existing Cookbooks, with...
    - a `name` (required)
    - a `description` (optional)
    - an uploaded image of the prepared Recipe (optional)
    - a `preparation` (required)
    - one or more Ingredients (required)
  - Edit an existing Recipe that I created by...
    - Changing the `name`, `description`, uploaded image, and/or `preparation`
    - Removing or Adding Ingredients
  - Destroy an existing Recipe that I created
    - Destroying a Recipe __does not__ destroy the Ingrdients, just the associations
  - From a Recipe's detail page, I can save the Recipe to an existing Cookbook
- __Ingredients__
  - Create an Ingredient with...
    - a unique `name` (required)
    - an uploaded image of the Ingredient (optional)
  - Edit the `name` and/or the uploaded image of an existing Ingredient that I created
  - Destroy an existing Ingredient that I created (this does not destroy any associated Recipes)

### Other Requirements
- A minimum 80% test coverage for all Models and Controllers.
