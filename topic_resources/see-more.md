SeeMore™
============

![SeeMore](http://www.theirishduck.info/wp-content/uploads/2013/06/plant.png)

A **feed** is an API that a web service uses to provide users with frequently updated content. A *feed aggregator*  is an application that acts as a central location for reviewing the content of feeds. It **injests** feeds and stores their content in its own datastore after [transforming](http://en.wikipedia.org/wiki/Extract,_transform,_load) it into a standard format.

## Goals
+ Learn how to work with OAuth
+ Gain experience in consuming with 3rd party APIs
+ Coordinate with a larger team
+ Work within the structure of 2 one-week Sprints
+ Learn how to work with Pivotal Tracker
+ Accumulate experience points in Rails
+ Accumulate experience points in rspec

## Guidelines

+ Groups of four will work with a Teacher acting as a Project Manager
+ Each group will assign a group leader to work with the Project Manager to organize the group work.
+ Each group will be responsible to deliver a final product to the Product Owner (Elise)
+ Use [pivotaltracker.com](http://pivotaltracker.com) as a project management service
+ Practice rspec to lead the development process of Models and Controllers
+ Build a logical user-flow that moves across multiple controllers and models
+ Use HTML/CSS to style your website.

## Expectations

Build a feed aggregator service that allows users to login via Twitter, Github, Instagram and Vimeo. It will allow users to view updates from all their tracked feeds in one location, and share them back to associated social media services.

### Technical Requirements
#### Bronze (20 points)
+ Allows Users to sign in and out using [OmniAuth's Developer Strategy](http://rubydoc.info/github/intridea/omniauth/master/OmniAuth/Strategies/Developer)
- Can search Twitter users
- Can add Twitter users to your SeeMore feed
- Can search for a Vimeo user
- Can add Vimeo users to your SeeMore feed
+ Can aggregate feeds from two separate social media feeds (Twitter & Vimeo)
- Write at least 20 specs (5 from each member)

#### Silver (20 points)
All of Bronze, plus:
- Save each social media post to the local database, duplicates should not be allowed.
+ Allows Users to sign-up and login with at least one social media account (Instagram (required), Twitter, Vimeo, Github)
- Can search and add Github users to your SeeMore feed
- Can search and add Instagram users to your SeeMore feed
+ Can aggregate feeds from
    - One or more Twitter users
    - One or more Vimeo users
    - One or more Github users
    - One or more Instagram users (must be authenticated with Instagram)

#### Gold (20 points)
All of Silver, plus:
- Automatically pulls in Twitter timeline feed for the authenticated user
- Automatically pulls in Instagram timeline feed for the authenticated user
+ Uses **cron** to periodically update feeds without duplication
+ Can send email or SMS messages to users to update them

#### Platinum (10 points)
+ Allows Users to share favorite stories back to social media services
+ offers API of aggregated feeds
+ add a Google Map that shows the location of any feed items that contain geolocative information


## Evaluation
+ Learning Goals (10 points)
    * Demonstrate comprehension of Rails
    * Comfort with Pivotal Tracker (and any other project tools used)
    * Working as a team
    * Accepting challenges by working on parts of the project outside your individual comfort zone

+ Client Satisfaction (10 points)
    * Visually appealing and polished
    * No major bugs
        - Minor bugs noted in Pivotal Tracker or as a Github issue
    * Good communication with Project Owner

+ Code Quality (10 points)
    * Metrics
        - Flog: no Controller method > 25, no Model method > 15
        - Rubocop: no more than 15 code style issues
        - Brakeman: no major security issues
        - Code Coverage: 90%+


### User Stories
Each team will meet with the Product Owner at the outset to develop a set of user stories and precise requirements in Pivotal Tracker.
