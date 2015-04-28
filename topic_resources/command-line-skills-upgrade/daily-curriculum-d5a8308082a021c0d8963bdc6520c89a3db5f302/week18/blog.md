# Blahgs

In this project, we will be building an AngularJS application with a pre-built
Rails API data source. The application will focus on using an interactive
front-end UI to create an engaging and multifaceted user experience.

We will utilize many of AngularJS's unique features, focusing on creating
and gaining an understanding of how AngularJS handles routing, controllers, 
templates, and user interaction features like ng-click, ng-model, and filters.

Students will work on individual applications, but they will be in a "co-worker" 
pair each day to communicate about problems, techniques, and progress. Students 
are encouraged to pair program or "mob" any issues or tasks that are difficult 
or confusing.

Students will also provide feedback each day on their confidence and comprehension 
of the material. This will help guide further development of their curriculum 
and help ensure that they get the review they need on particular parts of the 
frameworks.


## Goals

- Rapid Learning
- Learn the benefits of frameworks
- Build an AngularJS application
- Further explore the area of frameworks that you find most interesting


## Expectations

This project will include a lot of JavaScript and a lot of new information. You will
be using a new framework. You also have interviews in the first week. This is a lot, 
and it is not unlikely that there will be a lot of magic during this project. You are 
not expected to understand everything. You ARE expected to do the following:

- Work both individually and with classmates to try to understand core concepts
- Identify an aspect of the project to look into more closely, and attempt to understand
a higher percentage of the content related to that aspect (examples: creating interactive 
forms, validations, controllers, etc.)
- When copying code, attempt to understand, if not the specific mechanics, the overall
effect that the block of code has on their app
    - Draw parallels with Rails and familiar code to help enhance this understanding

There will be a lot of magic here, and you don't need to understand everything. Copying
some of your code is perfectly acceptable. Copying all of it is not.


## Bronze

As a user, I can:
- View an index of blahg posts
- Use a filter to only view certain blahg posts
- View a specific blahg post
- Create a new blahg post, which persists on refresh
  - On my edit page, as I create this new blahg post, I can see the contents of the
  blahg post in window next to my input fields as I type it, before I actually submit
  the post
- App uses at least 1 of each of the following: ng-click, ng-if, ng-repeat, ng-model

## For Silver, Gold, and Platinum:
Choose from the following, based on your interests. You can either pick one track
and try to work through it, or you can try a number of different things from different
tracks. Shoot for either breadth (accomplish a lot of different tasks) or depth 
(do just one task but dive in deeply and do it well).

### UX track

- As a user, I can search for a tag. The view will only show posts that use that tag.

- As a user, I can search for posts that do not contain a tag (example: I can search
for posts that do not have the tag "Ada"). The view will only show posts that do not
have that tag.

- As a user, I can search for posts by both tag included and tag excluded (example: 
I can search for posts that do not have the tag "Ada" but do have the tag "Bookis").
The view will only show posts that do have the "Bookis" tag but do not have the "Ada"
tag.

- Implement validation in your form using some/all of the following:
    - in the view:
        - ng-model
        - custom filters
        - directives

    - not in the view:
        - a helper method
        - a model method
        - a factory

- Create a custom <accordion> directive that shows the first three lines or so of
a post without redirecting you

- Create a custom directive that does some cool stuff with the Konami code

### Testing Track
#### NOTE: this will be largely individual, as Ellen doesn't have experience in this
- Write some unit tests (use Karma?)
- Write some end-to-end tests (use Protractor?)


### Integration Track
- Integrate with Twitter: as a user, I can click on one button to tweet my 
favorite recipe
- Integrate with Campfire or email: any time a user sees an error message, 
post an alert to Campfire or via email


### Diagnostics Track
- As an administrator, I can visit an admin portal that will show me more things 
about my site
    - Separate (but related): I must first log in securely to this site
    - Separate (but related): In order to log in, I must have an email invite from
      another administrator
- As an administrator, I can see the following diagnostic information at the 
admin portal (each piece is one point):
    - Which pages are viewed the most often
    - Which pages users spend the most time looking at
    - What locations viewers are looking at my page from

### I18n
- Use [angular-translate](https://github.com/angular-translate/angular-translate)
or something similar to implement internationalization/translation in your app.
    - You should look into/learn why it's a bad idea to use filters for translation

### Other
- Fork this repo, add a new suggestion for a task or an idea you'd like to explore,
and submit a pull request. Assign the pull request to Ellen. She'll review it, make
any necessary changes, and add it to the list.