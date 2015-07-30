# SeeMore

![SeeMore](http://www.theirishduck.info/wp-content/uploads/2013/06/plant.png)

A **feed** is an API that a web service uses to provide users with frequently updated content. A *feed aggregator*  is an application that acts as a central location for reviewing the content of feeds. It **injests** feeds and stores their content in its own datastore after transforming it into a standard format.

You and your team will build a feed aggregator service that allows users to login via Twitter, Github, Instagram and Vimeo. It will allow users to subscribe to updates from these feeds. Users can then view these updates all in one location as an aggregated feed.

## Goals
+ Learn how to work with OAuth
+ Gain experience in consuming with 3rd party APIs
+ Coordinate with a larger team
+ Accepting challenges by working on parts of the project outside your individual comfort zone

## Guidelines
+ Teams of four will work with a Teacher acting as a Project Manager
+ Teams will rotate team leader and standup leader roles on a weekly bases.
+ Each team will be responsible to deliver a final product to the Product Owner (Crystal)
+ Practice TDD
+ Spend time at the beginning creating user stories and defining precise requirements.

### Technical Requirements
#### Authentication
  - Allows Users to sign in and out using [OmniAuth's Developer Strategy](http://rubydoc.info/github/intridea/omniauth/master/OmniAuth/Strategies/Developer)
  - Allows Users to sign-up and login with at least one social media account (Instagram (required), Twitter, Vimeo, Github)

#### APIs
  Choose two of the APIs below to implement:
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
- Deployed to Heroku and link included in the Pull Request
- No major bugs
- Minor bugs noted as Github issues

### Added Fun!
  - Automatically pulls in Twitter timeline feed for the authenticated user
  - Automatically pulls in Instagram timeline feed for the authenticated user
  - Uses **cron** to periodically update feeds without duplication
  - Allows Users to share favorite stories back to social media services
