## Congo

Congo (named after a very large rainforest that is not the Amazon) will be an online store where a wide variety of products can be listed and sold by any user. In this project we will focus on reinforcing the major components of Rails, Model Validation, Unit and Functional testing, as well as introducing some more complex logic such as user authentication.

#### In this project you will learn

- Core comprehension of:
    - Routes
    - Controllers
    - Models
    - Views
- Functional Testing with rspec
- User based application logic
- User authentication

#### Guidelines

- Groups of four will collaborate in pairs or individually
- Use [Trello.com](http://trello.com) as a project management service
- Practice TDD (rspec) to lead the development process of Models and Controllers
- Build a logical user-flow that moves across multiple controllers and models
- Use HTML/CSS to style your website.

### Restrictions

- Do not use gems for user authentication (such as Devise)
- Do not use Rails `scaffold` generator (All other Rails generators are fine)

### Getting Started

1. Sign up for [Trello.com](http://trello.com)
2. As a group decide on an app name (this may help lead the aesthetic)
3. One team member:
    1. Create a repo with the same name as the app
    2. Push to Github
    3. Add the other team members as collaborators on Github
4. A different team member:
    1. Create a "Board" on Trello for your project
    2. Add your team members to the Trello "Board"


### Expectations

Build an online system for listing, selling, reviewing, and buying a wide variety of products listed by multiple merchants.

#### Guest User (Unauthenticated)

As a guest to the website (not signed in) I **can**:

- Browse all products
- Browse products by category
- Browse products by merchant (users)
- View any individual product with additional details
- Leave a review for a product providing:
    - A Text review
    - A rating out of 5
- Add in-stock products to my cart
- Remove products from my cart
- Change the quantity of an existing product in my cart
- Purchase the items in my cart, providing:
    - Email Address
    - Mailing Address
    - Name on credit card
    - Credit card number
    - Credit cart expiration
    - Credit Card CVV (security code)
    - Billing zip code
- Purchasing an order makes the following changes:
    - Reduces the number of inventory for each product
    - Changes the order state from "pending" to "paid"
    - Clears the current cart
- After purchasing an order, I can view a confirmation screen including:
    - Each item in the order with a quantity and line-item subtotal
    - A link to the item description page
    - Order total price
    - DateTime the order was placed
    - The current status of the order
- Sign up to be a merchant, providing:
    - Email Address
    - Username
    - Password (passwords cannot be stored in the database) ([suggested resoruce](#password))
    - Password confirmation
- Sign in to my merchant account

As a guest I **cannot**:

- Add products to the cart that are out of stock.
- View any link or page to manage any products
- View any of the account pages

#### Authenticated Users

As a signed-in user, I **can**:

- Do everything a guest user can do except for sign up and sign in.
- Sign out
- Create new categories (categories are shared between all merchants)
- Create a new product providing:
    - name
    - description
    - price
    - photo URL
    - stock
- Assign my products to any number of categories
- Retire a product from being sold, which hides it from browsing
- View an account page to edit/update my existing products
- View an account page showing my order fulfillment
- On the order fulfillment page:
    - Total Revenue
    - Total Revenue by status
    - Total number of orders by status
    - Filter orders displayed by status
    - Link to each individual order
    - A list of orders including at least one of my products:
        - Each order item sold by me with a quantity and line-item subtotal
        - A link to the item description page
        - DateTime the order was placed
        - Link to transition the order item to marked as shipped
        - The current status of the order ("pending", "paid", "complete", "cancelled")
- View an individual order to see the user's:
    - Name
    - Email address
    - Mailing address
    - Last four digits of their credit card
    - Credit card expiration date
    
As a signed-in user, I **cannot**:

- Review my own products
- View order items from a shared order that belong to another merchant
- View another users private data (i.e. order fulfillment or product management)


### Model Validations

Many of our models will have attributes that are required for our application to use and display data consistently. Each model will have attributes with requirements for a valid record ([Suggested Resource](#validations)). The requirements are summarized below:

#### User

- Username must be present
- Username must be unique
- Email Address must be present
- Email Address must be unique
- Password Confirmation must match Password

#### Product

- Name must be present
- Name must be unique
- Price must be present
- Price must be a number
- Price must be greater than 0
- Product must belong to a User

#### Order
    
- An Order must have one or more Order Items

#### OrderItem

- Must belong to a Product
- Must belong to an Order
- Quantity must be present
- Quantity must be an integer
- Quantity must be greater than 0

#### Review

- Rating must be present
- Rating must be an integer
- Rating must be between 1 and 5

## Submission Guidelines

Your project must be "live" on the web for evaluation. We recommend you deploy it on [Heroku](http://Heroku.com).

Your `README` file on Github should contain a link to your live site.

# Resources

The exact code in the following resources may not fit with your custom application, I recommend reading/watching them and assessing how you can implement the logic on your own.

- <a id="password" href="http://railscasts.com/episodes/250-authentication-from-scratch-revised">User Authentication with has_secure_password</a>

- <a id="validations" href="http://edgeguides.rubyonrails.org/active_record_validations.html">Active Record Validations</a>