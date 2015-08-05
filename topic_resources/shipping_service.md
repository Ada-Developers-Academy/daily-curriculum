# Shipping Service
Build a stand-alone shipping service API that calculates estimated shipping cost for an order from your Toys App application.

Something about [Active Shipping](https://github.com/Shopify/active_shipping)

## Learning Goals
- Develop the ability to read 3rd party code
- APIs
    - design
    - build
    - test
- Continue working with JSON
- Revisit
    - HTTP interactions
    - Testing of 3rd party services
- Develop a "client first" approach
- Increased confidence in working with 3rd party APIs

## Guidelines
- Practice TDD to lead the development process for Models and Controllers
- Create user stories keep the stories up-to-date throughout the project
- Deploy on Heroku
- Application will communicate with the Toys App app via JSON

## Expectations
Given shipping addresses and a set of packages, generate a quote for the cost of shipping for these items for a given shipper.

## Requirements
### Technical Requirements
- Implement the shipping quotes within [Toys](https://github.com/bookis/shipping-app-client)
- Responds with JSON and proper HTTP response codes
- Allow Users to get shipping cost quotes for different delivery types
- Allows Users to get a cost comparison of two or more shippers
- Returns a Delivery Estimate to Users
- Returns tracking information (when available)

### Error Handling
- When a User's request is incomplete, return an appropriate error
- When a User's request does not process in a timely manner, return an appropriate error
- Log all requests and their associated responses such that an audit could be conducted
- Deployed on Heroku and kept alive (no 20 min idling please!)

### Testing
- 100% test coverage for all Controller routes, Model validations, and Model methods

### Added Fun!
- Process actual shipping requests asynchronously, since you know how much to charge and where to ship to
- Integrate shipping service into a 2nd app (maybe cooks would like to ship ingredients to their homes?)
- Find the seam in Toys App between the shopping application and payment processing, and build a payment processing service
