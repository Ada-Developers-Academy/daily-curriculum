# Media Ranker

In this project we will focus on build a simple rails app that has three data models (Movie, Album, Book), we will be focusing on comprehending the rails request cycle and the scope and availability of each major and minor component. To maximize the focus on comprehension students will implement features based off of an existing website (http://media-ranker.herokuapp.com), and we will not use any associations or testing. Comprehension is the primary focus.

### Goals

By the end of the project students should be able to

- Describe the rails request cycle in their own words.
- Determine several available aspects to the current state at any point of a request:
    - `self`
    - @instance variables
    - local variables
    - request data (`params`, `session`, etc...) (if applicable)
    - Available methods to the current scope
    - The line of code the app has stoped running on


### Requirments

You must mimic **ALL** of the pages and **ALL** of the links and buttons on each of the pages located at http://media-ranker.herokuapp.com. 

Each data model will have are going to create standard RESTful (index, show, edit, update, new, create, destroy) routes.

Use [better_errors](https://github.com/charliesome/better_errors) to debug problems.

Research and ask as many questions as possible, at the end of the week you will be expected to have a 75% - 90% comprehension of the basic usage and role of:

- Routes
- Controllers
- Views
- Models

If any peice feels like magic, google it, debug it, ask questions, unless you are specifically told that a certain peice is too magic to concern your self with.

The project will not be required to be in any certain state at the end of the week, you will only be graded on your ability to describe and assess the process of a rails request cycle, and the state of any given point within a simliar peice of code.