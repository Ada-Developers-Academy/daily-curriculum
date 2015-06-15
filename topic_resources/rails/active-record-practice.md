# ActiveRecord Practice

- Create a new rails app (yep rails new).
- Create a model called `Student` with a name and two other attributes (like favorite pie and home state)
```
rails g model student name:string other_field:type
```
- Enter rails console.
- Create a record in the database for yourself.
- Create a record in the database for the students sitting on all four sides of you. Ask each of them for the information you've defined for your student class.
- If you're asking someone a question who has not yet setup thier `Student` model, offer to help.
- After all 5 records are created. Try to use the follwing methods
    - find
    - where
    - find_by
    - destroy
    - where.not
