# Ada Cooks!

The goal of this assignment is to build an online cookbook application where users can add Recipes and new Ingredients.


## User Stories

### Bronze Star
+ As a guest, I can create, edit, or delete a Recipe
+ As a guest, I can create or edit an Ingredient
+ As a guest, I can add or remove ingredients from a Recipe

### Silver Star
- As a guest, I can sign up to become a user
- As a user, I can create, edit, or delete my Recipes
- As a guest, I cannot create, edit, or delete any Recipes or Ingredients

### Gold Star
+ As a guest, I can search for Recipes by  typing in the name of an Ingredient


## Requirements
However far you and your partner get, the application should have, at a minimum, the following features:

+ Multiple Active Record models, with at least one "has_many through" relationship (Recipes <-> Ingredients for example)
+ some rspec
+ A "look and feel" that will make users want to cook!


## Platinum

+ Add the ability to browse for Recipes by Ingredient


## Double Bonus Gold Star Territory
+ Sign up for Code Climate (http://codeclimate.com) and add it to your project
+ Add the CarrierWave gem (https://github.com/carrierwaveuploader/carrierwave) and allow the user to upload a picture for a Recipe or Ingredient
+ Add the Devise gem (https://github.com/plataformatec/devise) to allow for multiple users, and for users to sign in or out
+ Add an adminsection that allows Users who have the correct access permissions to edit the Cookbooks, Recipes, etc of all Users in the system


## Evaluation

You will be evaluated on:

- Running `rspec` from Terminal with no failures
- Code quality (is your code organized and logical)
- Extra credit for additional methods to add neat functionality
- Extra credit for writing additional specs
- Extra credit for attractive or inventive user interface
