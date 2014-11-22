# Contact List

Create a Rails application that allows a user to manage a list of contacts.

Bronze
-------
- Create a Person (contacts) model with the attributes
    - first_name
    - last_name
    - phone
    - email
    - relationship
- Create a PeopleController which will handle:
    - Showing a list of all people
    - Show a single person
    - Create a new person
    - Update an existing Person
    - Delete a Person

Silver
------

- Create a Company model with the attributes:
    - name
    - city
    - state
- Add company_id to the Person model
- Create a CompaniesController to handle the CRUD of companies
- Add a drop down to fill the `company_id` attribute of People in the new and edit forms

Gold
------

- Create a Tag model
- Allow any number of Tags to be added to a Person (i.e. `sales`, `engineer`, `potential job`)
- Create a page to show all of the people associated with a tag
