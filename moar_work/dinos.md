# Dinos

Clone the [Dinos Active Record](https://github.com/Ada-Developers-Academy/dinos-active-record) Rails app
Set up the project by the following:

```bash
cd dinos-active-record
bundle install
rake db:create db:migrate db:seed
# creates, migrates, and adds data to the database.
```

Go into the `rails console` and query the newly created data using ActiveRecord
to find out the following

Bronze
------

- What is the name of the Dino with a genus of "Protarchaeopteryx"
- Alphabetically by genus, what is the last Dino?
- How many Dinos have a length of less than 20?

Silver
------

- How many Dinos have a genus that ends in "saurus"?
- How many Dinos have a length of less than 20 or a height greater than 20?
- How many eggs have the color "green" in the name?

Gold
-----

- How many eggs does the Dino with genus "Sinosauropteryx" have?
- What is the average height of all Dinos?

Platinum
--------

- How many eggs exist for all of the dinos with a genus which ends in "saurus".
- How many dinos have eggs which have the color "green" in the name?
- Create 10 eggs for each dino which has a genus that contains an "x".
