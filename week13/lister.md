# Lister

Lister will be an application where users can sign up, create new lists, and add items to those lists. Additionally Lister will have the ability to send emails using Delayed Job.

## Goals
+ Build a basic rails app.
+ Gain experience with ActionMailer
+ Implement a background job service
+ Use Javascript to manipulate objects on the page
+ Use AJAX to add/remove list items without a page refresh
+ Build a basic API to access a users lists
+ Accumulate experience points in Rails 

## Guidelines

+ Each student will work individually, but submit code to Github daily for project owner (Bookis) to review
+ Practice TDD (rspec) to lead the development process of Models and Controllers
+ Build a logical user-flow that moves across multiple controllers and models
+ Use any combination of javascript, jQuery, and coffee script for dynamic content
+ Use HTML/CSS to style your website.

## Expectations

Build an application where users can sign in to create lists, each list should be able to have any number of list items.

### Getting Started

The first stage of Lister will be implemented by following specs that have already been written for the basic user and session functionality. To get started fork and pull the following repo:

 [https://github.com/Ada-Developers-Academy/Lister](https://github.com/Ada-Developers-Academy/Lister)
 
 
This is the project you will be working out of. After pulling bundle and run your tests using guard:

    bundle
    guard
    
Use these errors to drive the development of the basic user and session functionality.

#### Important Notes

To pass the specs you will need to use the same class names and attributes that I used while writing the specs:

- `UsersController`
- `SessionController`
- `User`
    - `username`
    - `email`
    - `password_digest`
    
If you want to use different attributes and you feel comfortable with the specs, you can change the specs to reflect the naming choices of your own.
    
-----

When using generators, when you see a question like:

    Overwrite lister/spec/controllers/session_controller_spec.rb? [Ynaqdh]
    
Type `n` for no.

## Requirements

After getting all green specs, use TDD (referring to the previous specs) to develop the following user stories:

### **As a signed in user**

- I should be able to see a page containing all of my lists

----

- I should be able to see a page containing lists from all users

----

- When I click on a list name
- I should see a page showing only that list

----

- When I go to click on the link to create a new list
- Then when I input the name of the list and any optional fields
- Then I hit submit to create the list in the database
- I should be redirected to a page showing the items for a list

----

- When I view all lists
- I should be able to see lists from any other users

----

- When viewing someone else's list
- I should not be able to edit or add items to the list

----

- When viewing one of my own lists
- I should be able to see a form to add an item to my list
- When I click the submit button, an item should be added to my list

----

### **As a signed out user**

- When on the homepage
- I can see all users lists

----

- I should not be able to create a new list

----

- I should not be able to edit any lists

----

- When I sign up
- I should receive an email welcoming me to Lister

### **When adding and removing items**

- When I click the submit button to add an item
- The item should be saved to the database and added to the page without refreshing

----

- When I click the delete button to remove an item
- The item should be remove from the database and removed from the page without refreshing

### **When accessing the site via the JSON API**

- When I GET "/users/:user_id/lists" with the :json format
- I should get a JSON response that has an array of all lists belonging to the respective user, each including: 
    - List name
    - Number of items
    - Author name
    - ID
    - Created_at

-----

- When I get "/users/:user_id/lists/:id" with the :json format
- I should get a JSON response that has an hash of the list of the given id, including:
    - ID
    - List name
    - Author name
    - Created_at
    - An Array of items
        - Item Name

### **When sending an email**

- The email should be sent using a background working and Delayed Job

### Other considerations

- Shoot for > 90% test coverage
- Have at least 50 total spec (including the provided specs)
