# THIS IS A LIVING DOCUMENT
this project is going to be refactored and should not be considered up-to-date in its current form

# Cookbook

In this project, we will be building an AngularJS application with an Express 
and Node.js backend data source. The application will focus on building a 
multi-model recipe aggregation site, first focusing on building the back-end 
data source and then building an interactive front-end UI.

We will utilize many of AngularJS's unique features, focusing on creating
and gaining an understanding of how AngularJS handles routing, controllers, 
models, templates, and user interaction features like ng-click, ng-model,
and filters.

Students will work on individual applications, but they will be in a "co-worker" 
pair each day to communicate about problems, techniques, and progress. Students 
are encouraged to pair program or "mob" any issues or tasks that are difficult 
or confusing.

Students will also provide feedback each day on their confidence and comprehension 
of the material. This will help guide further development of their curriculum 
and help ensure that they get the review they need on particular parts of the 
frameworks.

## Goals

- Rapid Learning
- Learn the benefits of frameworks
- Build a Node.js database and a simple Express application
- Build an AngularJS application
- Further explore the area of frameworks that you find most interesting

## Expectations

This project will include a lot of JavaScript and a lot of new information. You will
be using at least three new frameworks. This is a lot, and it is not unlikely that
there will be a lot of magic during this project. You are not expected to understand
everything. You ARE expected to do the following:

- Work both individually and with classmates to try to understand core concepts
- Identify an aspect of the project to look into more closely, and attempt to understand
a higher percentage of the content related to that aspect (examples: creating the database,
creating interactive forms, validations, the Express controllers, etc.)
- When copying code, attempt to understand, if not the specific mechanics, the overall
effect that the block of code has on their app
    - Draw parallels with Rails and familiar code to help enhance this understanding

There will be a lot of magic here, and you don't need to understand everything. Copying
some of your code is perfectly acceptable. Copying all of it is not.

## Bronze

- Recipes include at least a:
    - Name
    - Description
    - String/text of directions
- Recipes have many Ingredients
- Ingredients have many Recipes
- Recipes can be viewed as a list (an index page)
    - This list can be filtered by a key word on the front-end
- Recipes can be viewed individually (a show page)
- New recipes can be created
    - These recipes are saved to the database
- All data goes through the Express/Node.js data source
- App uses at least 1 of each of the following: ng-click, ng-if, ng-each, ng-model

## For Silver, Gold, and Platinum:
Choose from the following, based on your interests. You can either pick one track
and try to work through it, or you can try a number of different things from different
tracks. Shoot for either breadth (accomplish a lot of different tasks) or depth 
(do just one task but dive in deeply and do it well).

The lists are written in order of approximate difficulty. DO start at the top
of the lists that interest you; DO NOT grab items randomly from the middle/bottom.

### Front-End/Angular Track
- As a user, I can search for a recipe by ingredient. The view will only show 
recipes that have that ingredient.
- As a user, I can search for a recipe by ingredient not included (example: I can
search for recipes that do not include pumpkin). The view will only show recipes
that do not have that ingredient.
- As a user, I can search for a recipe by both ingredient included and ingredient
excluded (example: I can search for recipes that do include pumpkin that do not
include nutmeg). The view will only show recipes that do have pumpkin and that do
not have nutmeg.

- Implement validation in your form using some/all of the following:
    - in the view:
        - ng-model
        - custom filters
        - directives

    - not in the view:
        - a helper method
        - a model method
        - a factory

- Create a custom <accordion> directive that expands the details on a div when 
you click on it without redirecting you to a new page

### Testing Track
#### NOTE: this will be largely individual, as Ellen doesn't have experience in this
- Write some unit tests (use Karma?)
- Write some end-to-end tests (use Protractor?)

### Back-End Track

#### User interactions
- As a user, I can search for a recipe by ingredient. The API will only return 
recipes that have that ingredient.
- As a user, I can search for a recipe by ingredient not included (example: I can
search for recipes that do not include pumpkin). The API will only return recipes
that do not have that ingredient.
- As a user, I can search for a recipe by both ingredient included and ingredient
excluded (example: I can search for recipes that do include pumpkin that do not
include nutmeg). The API will only return recipes that do have pumpkin and that do
not have nutmeg.
- As a user, I can log in to the application
- As a user, I can save my favorite recipes and view them when I log back in

#### Integrations
- Integrate with Twitter: as a user, I can click on one button to tweet my 
favorite recipe
- Integrate with Campfire or email: any time a user sees an error message, 
post an alert to Campfire or via email
- Put your API up on Heroku. As a developer, I should be able to set up my 
local project to pull from your API on Heroku.

#### Diagnostics
- As an administrator, I can log into a secure admin portal that will show me 
more things about my site
- As an administrator, I can see the following diagnostic information at the 
admin portal (each piece is one point):
    - Which pages are viewed the most often
    - Which pages do users spend the most time looking at
    - What locations viewers are looking at my page from

#### I18n
- Use [angular-translate](https://github.com/angular-translate/angular-translate)
or something similar to implement internationalization/translation in your app.
    - You should look into/learn why it's a bad idea to use filters for translation

#### Other
- Fork this repo, add a new suggestion for a task or an idea you'd like to explore,
and submit a pull request. Assign the pull request to Ellen. She'll review it, make
any necessary changes, and add it to the list.