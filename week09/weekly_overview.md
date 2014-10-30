# Week 9

In week 9 we will be focusing on comprehension of the rails request cycle. Students will be creating a simple rails app to store and rank media by type. By the end of the week students will be able to identify each piece of the rails request cycle and the methods and variable scopes available within each of them.

## Goals

- Identify the role of HTTP request
- Advanced understanding of the role, scope, and syntax or routes.rb
- Understanding of rails controller
    - Native controller method (params, session, render, redirect_to, etc...)
    - Scope with inter-controller methods and instance variables
- Understanding of rails views,
    - Availability of controller methods and instance variables
    - View Helpers
- **Learn to identify and describe the current state and availabilty of different methods and variables at any given point in the request cycle.**

## Schedule
### Monday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:15 - 10:00**  | [Project Presentations](../week8/project-outline.md) |
| **10:00 - 11:00**   | Betsy Quiz |
| **11:00 - 11:30**   | [Media Ranker Overview](resources/media_ranker.md) |
| **11:30 - 12:30**  | [Rails request state](monday/rails-request-state.md)        |
| **12:30 - 5:00**  | [Media Ranker](resources/media_ranker.md)          |

### Tuesday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**   | Warm Up)                |
| **9:30 - 9:45**   | [Quiz](https://canvas.instructure.com/courses/881804/quizzes/1073953)                |
| **9:45 - 10:15**  | Betsy Quiz Recap          |
| **10:15 - 11:15**  | Lecture          |
| **11:15 - 1:30**  | [Media Ranker](resources/media_ranker.md)          |
| **1:30 - 2:15**  | Aki & Erica from Marchex          |
| **2:15 - 5:00**  | [Media Ranker](resources/media_ranker.md)          |


### Wednesday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:30 - 10:15**  | [View methods](wednesday/view-methods.md)        |
| **10:15 - 11:15**  | [Routes 102](wednesday/routes-102.md)|
| **11:15 - 4:30**  | [Media Ranker](resources/media_ranker.md)          |
| **4:30 - 5:00**  | Carol Lin from Zillow          |

### Thursday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**   | [Quiz](https://canvas.instructure.com/courses/881804/quizzes/1073955)                |
| **9:30 - 11:15**  | [Refactoring](thursday/refactoring.md)        |
| **11:15 - 5:00**  | [Media Ranker](resources/media_ranker.md)          |

### Friday

No Class.

### Extra Lectures
| Time              | Topic               |
|:-----------------:|:--------------------|
|  | [Rails RESTful Routes](monday/resources/restful-routes.md)        |
|  | [Controller methods](tuesday/controller-methods.md)        |


**Weekend Homework**

Use a TDD approach, either:

Create your own app

OR

Create a single serving (no users) version of Twitter. The app should have:

- Tweet model
    - body (must be present, max 140 characters long)
    - author
- TweetsController
    - An `index` action which shows all of the tweets
    - A `show` action to view a specific tweet
    - A `new` action (optional, you can put the form on `index`)
    - A `create` action where tweets are created

- tweet_spec.rb
    - Testing validations of body (presence and length)
    - Testing any addition methods you add
- tweets_controller_spec.rb
    - Test each controller action
    - No need to test private actions

**Extra Credit**

Implement Users using a TDD approach.
