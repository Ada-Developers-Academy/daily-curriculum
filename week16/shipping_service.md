Shipping Service
=================

Build a stand-alone shipping service API that calculates estimated shipping cost for an order from your Toys App application

Goals
--------
- Develop ability to read 3rd party code
- APIs
    + design
    + build
    + test
- Working with JSON
- Revisit
    + HTTP interactions
    + Testing of 3rd party services
- Develop a "client first" approach
- Increase confidence in working with 3rd party APIs

Guidelines
----------

+ Practice TDD (rspec) to lead the development process of Models and Controllers
+ Create a new PivotalTracker project and keep the stories up-to-date
+ Deployed on Heroku
+ Communicates with the Toys App app via JSON


Expectations
------------
Given addresses and a set of packages, generate a quote for the cost of shipping for a given shipper.

Technical Requirements
------------

+ When a User's request is incomplete, return an appropriate error
+ When a User's request does not process in a timely manner, return an appropriate error
+ Allow Users to get shipping cost quotes for different delivery types
+ Allows Users to get a cost comparison of two or more shippers
+ Returns a Delivery Estimate to Users
+ Returns tracking information (when available)
+ Logs all requests and their associated responses such that an audit could be conducted.
+ Deployed on Heroku and kept alive (no 20 min idling please!)
+ Responds with JSON and proper HTTP response codes
- Implement the shipping quotes within [Toys](https://github.com/bookis/shipping-app-client)

### Extra Stuff

+ Process actual shipping requests asynchronously, since you know how much to charge and where to ship to
+ Integrate shipping service into a 2nd app (maybe Gardeners would like to ship tools to their homes?)
+ Find the seam in Toys App between the shopping application and payment processing, and build a payment processing service


## Evaluation
+ Learning Goals
    * Demonstrate comprehension of Rails
    * Comfort with Pivotal Tracker (and any other project tools used)

+ Client Satisfaction
    * Well-formed JSON API
    * No major bugs
        - Minor bugs noted in Pivotal Tracker or as a Github issue

+ Code Quality
    * Metrics
        - Rubocop: no more than 15 code style issues
        - SimpleCov coverage for all Controller routes, Model validations, and Model methods
