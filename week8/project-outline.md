## Exploratory Project

In our exploratory project we will be allowing students to define their own feature and focus requirements. In this project, we will _not_ focus on specific feature sets, but rather on completeness. You get to decide what features you want to build and the size of the scale/scope of your project. Whatever you decide, the application should be production-ready and polished, ready to share with your classmates when you arrive back from break. 

You are free to use the language and framework of your choosing. You are also free to make the project as small or large as you desire. One of your focuses should be time management and setting realistic expectations.

#### Requirements

- Time management and expectations; choose a project that will fit with your availability over the two-week period
- Must be an application (no completely static HTML sites)
- Must be "complete" (where applicable)
    - Polished HTML 
    - Refactored code
    - No broken links or paths
    - Good test coverage (SimpleCov)
    - Good code quality (Rubocop)
    - Presentable
    - End user should never be confused or think "that's weird..."

#### Ideas

Sometimes it's difficult to think of *what* to build, so here are a few ideas of apps that you could build:

**Holiday Reads**

Use the [Google Book API](https://developers.google.com/books/) to create an application where a user can: 
- create an account
- search for and add friends by entering friend's email address or name
- search for books by author or title
- add a book to own wish list and/or completed list

Additional Possibilities:
- share a book with a friend
- view a leader board that compares own number of books completed versus friends and everyone

Email Elise for questions, ideas, or clarifications about this project. (<elise.worthy@adadevelopersacademy.org>)

**adaTunes**
Create an application that allows users to manage their music collection, where a user can:
- create an account
- select Albums that they own from a list in the existing system
- create new Albums, Artists, and Tracks that aren't in the current system
- create Playlists of their favorite Tracks
- allow users to browse other Users' collections, Artist pages, and Albums

Additional Possibilities:
- output Playlists as a PDF
- add a "Login With Twitter" feature with Devise
- allow users to upload cover art using Carrierwave
- use the Amazon-Album-Art gem to import cover images from Amazon

**Hands Up**

Create an application that allows the class to simultaneously vote on a topic. Users can:
- Sign up
- Create a new topic
- See a list of all open topics
- Cast a single vote on the topic
- See the results for any topic

Additional Possibilities:
- Use [Highcharts](http://highcharts.com) to graph the results.
- Use AJAX to poll for changes when viewing results (changes would appear on the page without reloading)
- Allow users to choose to vote anonymously. 

This application is reletively small, consider using a 100% TDD approach and/or implement a stylized design.

Email Bookis for questions, ideas, or clarifications about this project. (<bookis@adadevelopersacademy.org>)

**Marketer**

Create an application that serves a single page to promote *something* (anything, a winnebago if nothing else). Focus on design and modern HTML/CSS techniques. Additionally, the application should record the number of visitors to the site. The database should record:
- IP Address
- Number of visits (update returning visitors)
- If they are using a mobile device.

As the site owner you should be able to see a dashboard of the past 24 hours including:
- The total number of visitors
- The ratio of return visitors to new visitors
- The ratio of mobile visitors to non-mobile visitors

Additional Possibilities:
- Implement javascript to do fancy things (fading in/out content, smooth scrolling, rotating images, etc...)
- Capture additional data (browser, operating system, location)
- Use javascript to capture when a user leaves the site and record the amount of time spent viewing the site.

Email Bookis for questions, ideas, or clarifications about this project. (<bookis@adadevelopersacademy.org>)
