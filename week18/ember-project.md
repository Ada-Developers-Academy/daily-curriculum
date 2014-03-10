# Digistore

In this project we will be building an ember.js appliction using a service backed
data source. The application will focus on building a multi-model commerce site,
first focusing on digital (no shipping) items.

We will utilizing the majority of ember.js's major features including RESTful models,
Controllers, Routes, Templates, and Helpers.

Students will work on individual applications, but they will be in a "co-worker"
pair to communicate about problems, techniques, and progress. And even pair program
to resolve difficult issues or large tasks.

## Goals

- Learn the benefits of front-end focused frameworks
- Learn and compare the MVC flow within ember.js
- Build a single-page application
- Use Fixtures for rapid development
- Build a database backed service to query via HTTP

**Stretch Goals**

- Use an existing service as a models data source
- Integrate a credit card payment processor

## Bronze

### Products

- Products include at least a:
    - Name
    - Price (in cents)
    - Image (~800x600, placeholders ok (placekitten.com))
    - Avatar (50x50, placeholders ok (placekitten.com))
    - Description
- Products can be viewed as a list
- Products can be viewed individually for a full description
- Products can be added to the customers cart

### Cart

- A cart includes at least:
    - Items
- The cart can be viewed
    - The customer can see the current subtotal
    - The customer can see the current Items including: product name, price, quantity
- The customer can remove items from the cart
- The customer can update the quantity of an item
- The customer can proceed to checkout
  
    
### Items

- An Item includes at least:
    - Product
    - Current price of product
    - Quantity
    
### Order / Checkout

- An Order includes at least
    - Customer Name
    - Email
    - Cart
    - Transaction
    - Status [paid, canceled]
- A customer can input their personal details (see above)
- A customer can input their credit card, CVV, Zip, and expiration date
- When the customers submits their checkout form:
    - If the response is successful
        - Save the Order to the DB
        - Show a confirmation page
        - Send a confirmation email to the customer
    - Else
        - Show the customer an error
        - Allow the customer to update their info
        
### Admins

- I can manage products (create, update, delete)
- I can view all of the orders sorted by status
- I can change the status of an order
    
### Data Source

- Build a Rails API to use as the data source for all models
- Use the Ember RESTAdapter to communicate with the API

## Silver

### Admin

- Checkout
    - Use a credit card processor to process and charge the given credit card
    - Record the credit card processor response as a transaction

- As an admin
    - I can see a map showing a pin for each order
    - I can see the total number of orders by country
    - I can refund a partial or full amount of the users order
    - I can manage/upload images for products from file
    
## Gold

- Add to Order
    - Address

- Cart
    - The customer can see additional Tax (9.5% if in WA state otherwise 0%)
    - The customer can enter basic shipping info to see shipping rates.
    - The customer can select a shipping rate (the total should update)

- As an admin
    - I can create a shipment with the correct carrier
    - When an order is marked as shipped
        - A shipping confirmation is sent to the customer
    - I can send an email including tracking information from the carrier

## Platinum

- As a customer
    - I can click a link to "Chat with Customer Service"
    
- As an admin, when a customer clicks to chat, if I am on the site:
    - A chat window opens, with a individual live dialog with each customer.
    