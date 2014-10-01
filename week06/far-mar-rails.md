# Far Mar Rails

Build a database backed application to view, create, and manage farmers markets as well as their vendors, products, and sales.
In this implementation we won't be using static data, but rather building a tool to allow markets and/or vendors to sign up and add their own data.

As you are using ActiveRecord to access the database compare the methods that are given to those you had to create in the CSV implementation of FarMar

This project is mean to be exploratory. Take time to try to dive into each piece of Rails (routes, controllers, models, views)

## Requirements
However far you and your partner get, the application should have, at a minimum, the following features:

- Multiple Active Record models, with at least one "has_many through" relationship (Recipes <-> Ingredients for example)
- Push the application to Heroku
- A "look and feel" that will make happy!


## Best Practices

- Use git relentlessly
- Use correct indentation
- Pair program on difficult problems or to share learning experiences.

## User Stories

Bronze
---------
- As a guest, when I visit "/", I can sign up/in as a new Vendor (without authentication)
- As a vendor, I can create or edit a Market
- As a vendor, I can create, edit, or delete my Products
- As a vendor, I can create, edit, or delete my Vendors

Silver
--------
- As a vendor, I can create a Sale for one of my Products
- As a user, I can view all Markets
- As a user, I can view a specific Market, I should see it's attributes as well as a list of it's vendors

Gold
------
- As a vendor, I can see a list of my Sales
- As a vendor, I can see a total of all of my Sales

Platinum
--------
- As a user, I can see a map with pins representing each Market
- As a vendor, I can see a list of my Sales for the current month
- As a vendor, I can see a total of my Sales for the current month
