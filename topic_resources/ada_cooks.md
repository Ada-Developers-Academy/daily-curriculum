# Ada Cooks!

The goal of this assignment is to build an online cookbook application where users can add Recipes and new Ingredients, create Cookbook collections of different Recipes, and keep track of their Ingredients and Gadgets.


## User Stories

### Bronze Star
+ As a user, I can create, edit, or delete a Recipe 
+ As a user, I can create, edit, or delete a Cookbook
+ As a user, I can create or edit an Ingredient
+ As a user, I can add or remove a Recipe from a Cookbook

### Silver Star
+ As a user, I can create or edit an Gadget
+ As a user, I can add a Gadget to my collection

### Gold Star
+ As a user, I can search for Recipes by  typing in the name of an Ingredient or Gadget


## Requirements
However far you and your partner get, the application should have, at a minimum, the following features:

+ Multiple Active Record models, with at least one "has_many through" relationship (Recipes <-> Ingredients for example)
+ some rspec in addition to any provided to you
+ A "look and feel" that will make users want to cook! 


## Pairs

We're going to assign partners for this project. 

|                      |                    |
|:--------------------:|:------------------:|
| Whitney-Rose Levis   | Sue White          |
| Galina Yermicheva    | Blake Johnson      |
| Ellen Wondra-Lindley | Simone Sydnor      |
| Shadae Holmes        | Davida Marion      |
| Elizabeth Uselton    | Anne Kimsey        |
| Liz Rush             | Melinda Mizuta     |
| Hsing-Hui Hsu        | Christina Thompson |
| Asha Golveo          | Audrey Carlsen     |


## Extra Credit

+ Add the ability to browse for Recipes by Ingredient or Gadget
+ Code Metrics
    + less than 20 issues reported by Rubocop
    + no method with a Flog score > 30
+ Add a feature that allows users to keep track of what Ingredients are in their physical kitchen. Add a SpiceRack, Pantry, Refrigerator, and Freezer model, and create a "has_many through" relationship. Ingredients should have a column that determines which location they belong in, and a quantity column should be on the "has_many through" relationship model.


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

