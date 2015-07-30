SeeMore™
============

![SeeMore](http://www.theirishduck.info/wp-content/uploads/2013/06/plant.png)

A **feed** is an API that a web service uses to provide users with frequently updated content. A *feed aggregator*  is an application that acts as a central location for reviewing the content of feeds. It **injests** feeds and stores their content in its own datastore after [transforming](http://en.wikipedia.org/wiki/Extract,_transform,_load) it into a standard format.

## Goals
+ Learn how to work with OAuth
+ Gain experience in consuming with 3rd party APIs
+ Coordinate with a larger team
+ Accepting challenges by working on parts of the project outside your individual comfort zone

## Guidelines

+ Groups of four will work with a Teacher acting as a Project Manager
+ Each group will assign a group leader to work with the Project Manager to organize the group work.
+ Each group will be responsible to deliver a final product to the Product Owner (Crystal)
+ Practice TDD
+ Build a logical user-flow that moves across multiple controllers and models

## Expectations

Build a feed aggregator service that allows users to login via Twitter, Github, Instagram and Vimeo. It will allow users to subscribe to updates from these feeds. Users can then view these updates all in one location.

### Technical Requirements
#### Authentication
  - Allows Users to sign in and out using [OmniAuth's Developer Strategy](http://rubydoc.info/github/intridea/omniauth/master/OmniAuth/Strategies/Developer)
  - Allows Users to sign-up and login with at least one social media account (Instagram (required), Twitter, Vimeo, Github)

#### APIs
  Choose two of the APIs below to implement
  - Twitter
    - Search users
    - Subscribe to a user's Twitter updates
  - Vimeo
    - Search users
    - Subscribe to a user's Vimeo updates
  - Instagram
    - Search users
    - Subscribe to a user's Instagram updates

#### Functionality
  - A user can view all subscribed feeds on one page in chronological order
  - Save each social media post to the local database, duplicates should not be allowed

#### Testing
  - 90% Test Coverage

#### Look & Feel
  - Visually appealing and polished



### Final Submission
- Deployed to Heroku and link included in the README
- No major bugs
  - Minor bugs noted as Github issue(s)



### Added Fun!
  - Automatically pulls in Twitter timeline feed for the authenticated user
  - Automatically pulls in Instagram timeline feed for the authenticated user
  - Uses **cron** to periodically update feeds without duplication
  - Allows Users to share favorite stories back to social media services

+ Code Quality
    * Metrics
        - Flog: no Controller method > 25, no Model method > 15[?]
        - Rubocop: no more than 15 code style issues[?]
        - Brakeman: no major security issues[?]
        - Code Coverage: 90%+


### User Stories
Each team will meet with the Product Owner at the outset to develop a set of user stories and precise requirements.
