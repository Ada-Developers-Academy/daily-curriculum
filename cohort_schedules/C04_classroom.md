# Cohort 4 Classroom Calendar

## At a Glance

| Date    | Week                | Topic
|---------|---------------------|-----------------------------------------
| Sept 21 | [Week 01](#week-1)  | Student Orientation, Bash, Ruby
| Sept 28 | [Week 02](#week-2)  | Ruby II
| Oct 5   | [Week 03](#week-3)  | Ruby III
| Oct 12  | [Week 04](#week-4)  | Ruby IV
| Oct 19  | [Week 05](#week-5)  | Ruby V
| Oct 26  | [Week 06](#week-6)  | HTTP, DOM, HTML, CSS, Sinatra
| Nov 2   | [Week 07](#week-7)  | Sinatra, Databases
| Nov 9   | [Week 08](#week-8)  | Intro to Rails
| Nov 16  | [Week 09](#week-9)  | Rails II, Intro to Agile
| Nov 23  |                     | __Thanksgiving Break__  
| Nov 30  | [Week 10](#week-10) | Testing in Rails, Individual Project
| Dec 7   | [Week 11](#week-11) | Group Rails Project
| Dec 14  | [Week 12](#week-12) | Group Rails Project
| Dec 21  | [Week 13](#week-13) | Special Topics & Group Rails Project + __Break__
| Dec 28  |                     | __Winter Break__
| Jan 4   | [Week 14](#week-14) | Rails Project - Using APIs
| Jan 11  | [Week 15](#week-15) | Rails Project - Using APIs
| Jan 18  | [Week 16](#week-16) | Rails Project - Create API
| Jan 25  | [Week 17](#week-17) | Intro to Javascript
| Feb 1   | [Week 18](#week-18) | JavaScript API project
| Feb 8   | [Week 19](#week-19) | Pair JS Framework Project
| Feb 15  | [Week 20](#week-20) | Capstone Project, Interview Prep
| Feb 22  | [Week 21](#week-21) | Capstone Project
| Feb 29  | [Week 22](#week-22) | Capstone Project
| Mar 7   | [Week 23](#week-23) | Capstone Project
| Mar 14  | [Week 24](#week-24) | Capstone Project Presentations
| Mar 21  |                     | __Spring Break__
| Mar 28  | [Week 25](#week-25) | Internship Spike Project
| Apr 4   | [Week 26](#week-26) | Internship Spike Project
| Apr 11  | [Week 27](#week-27) | Internship Spike Project
| Apr 18   |                     | __INTERNSHIP BEGINS__


## Week 1

### Learning Goals

  + Introduction to the program
      + Get to know each other (students and staff)
      + Understand expectations
      + What is Ada?
  + Working Ruby development environment
  + Comfort with basic OS X Hotkeys
  + Comfort with basic UNIX command-line skills
      + navigation
      + file manipulation
      + grep
      + man pages
      + modifying your terminal
  + Ruby history & background
  + Learning basic ruby concepts
      - irb
      - Methods
      - Iterators
      - Variables
      - Conditionals
  + Learn about basic tools
      - Text Editors (Atom)
      - Terminal

### Resources
[How to OS X](../topic_resources/how-to-os-x.md)  
[Introduction to Unix](../topic_resources/nix.md)  
[Installfest](../topic_resources/installfest.md)  
[Terminal Aliases & Profile](http://mac.tutsplus.com/tutorials/terminal/speed-up-your-terminal-workflow-with-command-aliases-and-profile/)

[Introduction to Ruby](../topic_resources/ruby_101.md)  
+ Overview  
+ Community  
+ IRB  
+ Math  
+ Basic variables  
+ Using methods  

[Introduction to Atom](../topic_resources/atom.md)  

[Ruby 102](../topic_resources/ruby-102.md)  
+ String  
+ Symbol  
+ Number  
+ Array  
+ Hash (Intro)  

[Ruby 103](../topic_resources/ruby-103.md)  
+ Iterators  
+ Block  
+ Block scope  

[Flow Control](../topic_resources/flow-control.md)
+ Boolean  
+ Conditionals (excluding elsif)  

[More on Conditionals & Flow Control](../topic_resources/ruby-104.md)  
+ Compound conditionals  
+ While  
+ Until  
+ Case/when  

[Literals](../topic_resources/literals.md)  

### Projects/Exercises
[Calculator](https://github.com/Ada-C4/Calculator)  
[Random Menu](https://github.com/Ada-C4/Random-Menu)  

## Week 2

In Week 2 we continue to discover the Ruby language with more exercises involving command-line scripts. We will focus the majority of our time on Objects, cementing the learning of Hash, Array, and String functionality, and begin to explore other standard classes from Ruby core (Dates and Times, for example.)

### Learning Goals

- Scope
- Learn core Ruby concepts
    - Objects
    - Object Inheritance
- Solidify our knowledge of Strings, Arrays, and Hashes
- Intro to Git
- Using gems

### Resources
[Objects](../topic_resources/object-orientation.md)  
+ Creating methods  
+ new  
+ Creating classes  
+ initialize  
+ attributes  

[Local & Instance Variables & Scope](../topic_resources/variables_and_scope.md)  
+ Difference between local and instance variables  
+ Variable scope  

[Hashes](../topic_resources/hash.md)  
+ Creation  
+ Initialize an Object  

[Hash Practice](../topic_resources/hash-practice.md)  

[Introducing Gems](../topic_resources/introducing-gems.md)  
+ Installation  
+ Usage  
+ Research  

### Projects
[Solar System Project](https://github.com/Ada-C4/Solar-System)  
[Baby Dragon Project](../topic_resources/baby_dragon.md)  

[MasterMind](../topic_resources/mastermind.md)  
[Word Guess](https://github.com/Ada-C4/Word-Guess)  


## Week 3
In Week 3 we will be learning some intermediate ruby ideas such as advanced variables, inheritance and Enumerable. For the project we will be building a multiple-wave pure ruby application using a CSV database and inheritance called [Bank Accounts](https://github.com/Ada-C4/BankAccounts).

By the end of the week students should be able to build a ruby DSL for a relational CSV backed database using basic ruby methodologies and best practices.

### Learning Goals

  - Learn basic/intermediate ruby concepts and methods
      - Scopes of all variable types (local, instance, global, etc...)
      - Enumerable methods
  - Running Koans
  - Build a CSV backed ruby application
  - Build an application using inheritance
  - Collaborate on code via [Github](http://github.com)

### Resources
[Enumerable Methods](../topic_resources/enumerable.md)  
[Inheritance](../topic_resources/inheritance.md)  
[Advanced Variables](../topic_resources/advanced_variables.md)  
[Reading from CSV](../topic_resources/csv_database.md)  
[Assertions](../topic_resources/assert.md)  
[More on Assertions](http://en.wikipedia.org/wiki/Assertion_(software_development)  
[Ruby Koans](../topic_resources/koans.md)  

### Projects
[Bank Accounts](https://github.com/Ada-C4/BankAccounts)

## Week 4

In Week 4 we start working with Test-Driven Development (TDD) and advanced Ruby concepts. We will spend a few days exploring TDD and the RSpec toolset through building our own projects and tests.

### Learning Goals

  - Solidify knowledge and use of intermediate ruby concepts
    - Scopes of all variable types
    - Enumerable methods
  - Begin an introduction into computer science (CS) fundamental concepts  
  - Working through Koans
  - Unit testing your application with Rspec
  - Practice pair programming

### Resources
[TDD/BDD](../topic_resources/tdd_bdd.md)  
[RSpec](../topic_resources/rspec.md)  

### Projects
[Scrabble](https://github.com/Ada-C4/Scrabble)  

## Week 5
In Week 5 we will re-visit some topics introduced in previous weeks to assist in concept solidification. We will work as individuals on the FarMar project in order to gain some solid footing in CSVs as databases, and additional practice using intermediate Ruby concepts. By the end of the week students should be able to build a ruby DSL for a relational CSV backed database using basic ruby methodologies and best practices.

### Learning Goals

  - Introduce code coverage as a methodology for ensuring accurate testing
  - Solidify git workflow process, specifically with a pair
  - Use intermediate ruby concepts and methods
    - Variable scope
    - Class methods vs Instance methods
    - Enumerable methods
  - Build a CSV backed ruby application

### Resources
Pair programming
Code Coverage Setup

### Projects
[FarMar](https://github.com/Ada-C4/FarMar)

## Week 6
In Week 6 we will cover an introduction of the "plumbing" of the Internet and how clients such as web browsers communicate with servers. We will be learning the basics of HTML & CSS. By the end of the week we will style a single page website using the common HTML & CSS practices.

Our learning will focus on the usage of basic HTML tags and their potential attributes. We will learn about CSS selectors, cascading rules, and common techniques for creating important web page elements. By the end of the week students should be able to create and style a webpage using valid HTML and CSS.

### Learning Goals
- Learn basic architecture of the Internet
- Learn the HTTP response cycle
- Learn basic techniques and best practices for HTML
- Learn basic techniques and best practices for CSS
- Build a personal blog in Sinatra

### Resources
[Intro to HTTP](../topic_resources/networking.md)  
[HTML](../topic_resources/html.md)  
[HTML Divide and Conquer](../topic_resources/html-d&c.md)  
[Intro to Sinatra](../topic_resources/sinatra-practice.md)  
[CSS](../topic_resources/more-css.md)  
[CSS Divide & Conquer](../topic_resources/css-d&c.md)  
[ERB & layouts](../topic_resources/erb_and_layouts.md)

### Projects
[Sinatra Site](https://github.com/Ada-C4/SinatraSite)  

## Week 7
In Week 7 we continue using Sinatra to solidify our understanding of web page elements using forms and additional HTTP verbs.

Our learning will cover an introduction to relational database concepts as well as understanding how to utilize these concepts. This includes an introduction to using SQL concepts using SQLite.

### Learning Goals
- Learn the HTTP verbs and the appropriate scenarios to use them
- Learn how and when to use forms in our web pages
- Enhance Sinatra blog using forms
- Learn the basics of relationship database constructs
- Practice pair programming
- Gain exposure to deployment via Heroku

### Resources
- [Advanced Sinatra](https://github.com/kariabancroft/SinatraDogs)  
- [Creating & Submitting Forms](../topic_resources/submitting-forms.md)  
- [HTTP Verbs, CRUD & Idempotency](../topic_resources/http-verbs.md)  
- [Intro to Databases](../topic_resources/database/intro_to_db.md)  
- [More Forms](../topic_resources/checkboxes-and-radio-buttons.md)  
- [Using SQL](../topic_resources/database/using_sqlite.md)  
- [Heroku Installfest](../topic_resources/heroku_installfest.md)  
- [Heroku](../topic_resources/heroku.md)  

### Projects
- [Scrabble Sinatra](https://github.com/Ada-C4/ScrabbleSinatra)  
- [Tasks List](https://github.com/Ada-C4/TaskListSinatra)  

## Week 8
In week 8 we introduce students to the Ruby on Rails framework, which will be the focus of much of the work for the remainder of the course. Working individually, students build a basic Rails application. The focus is on learning how Rails and its implementation of MVC differ from Sinatra, how to work with ActiveRecord models, and begin to develop basic proficiency with Rails.

### Learning Goals
- Solidify understanding of web response cycle
- Introduce Rails
  - ActiveRecord
  - Controllers, Views & Routes
  - Forms
- Introduce Data Modeling
- Improve workflow

### Resources
- [RESTful Routing](../topic_resources/resources/restful-routes.md)
- [Intro to MVC](../topic_resources/resources/intro-to-mvc.md)
- [ActiveRecord](../topic_resources/rails/active_record.md)
- [ActiveRecord Practice](../topic_resources/rails/active_record_practice.md)

### Projects
- [Tasks in Rails](https://github.com/Ada-C4/TaskListRails)

## Week 9
In week 9 students continue to expand their knowledge of Ruby on Rails, learning how ActiveRecord can be used to achieve data/model designs with relationships. Working in pairs, students build upon their existing experience by revisiting the Farmer's Market project from week 5 in which they first dealt with a large, inter-related dataset. Additionally this week students are introduced to Agile development practices using Kanban boards with [Trello](https://trello.com/).

### Learning Goals
- Solidify understanding of data modeling in MVC context
- Knowledge of one-to-one and one-to-many relationships, with primary and foreign keys
- Better understanding of CRUD routes through Rails resources
- Improve workflow with task tracking/management

### Resources
- [ActiveRecord Relationships](../topic_resources/rails/active-record-relationships.md)
- [Advanced Routing in Rails](../topic_resources/rails/routes-102.md)
- [Gemsets](../topic_resources/rails/gemsets.md)
- [Agile Development Methodology](../topic_resources/agile.md)

### Projects
- [FarMar in Rails](https://github.com/Ada-C4/FarMarRails)

## Week 10
For week 10 students continue to build web applications with the Ruby on Rails framework. The focus in this week is on testing both models and controllers using RSpec. A second major theme for the week is the use of [Bootstrap](https://getbootstrap.com/) to quickly build responsive websites. Basic validations for model classes are introduced, and the week's project has requirements for using them on each model.

### Learning Goals
- Understand how models can be checked for validity, and how validation requirements can be defined
- Extend RSpec knowledge from pre-web projects (Scrabble, FarMar) into the Ruby on Rails context
- Understand how to build DRY spec code by using shared examples
- Improve front-end design capabilities and productivity using a responsive, grid-based framework

### Resources
- [ActiveRecord Validations](../topic_resources/rails/validations.md)
- [Testing in Rails with RSpec](../topic_resources/rails/rspec-with-rails.md)
- [RSpec Shared Examples](../topic_resources/rails/rspec-shared-examples.md)
- [Easy Site Design with Bootstrap](../topic_resources/bootstrap.md)
- [Rails Entity-Reltionship Diagrams](../topic_resources/rails/rails-erd.md) ([rails-erd gem](https://github.com/voormedia/rails-erd))

### Projects
- [Media Ranker](https://github.com/Ada-C4/MediaRanker)

## Week 11
Week 11 brings the first group, multi-week project for students. This is a major expansion of the project development process that we've used in the classroom until now. In order to emphasize the Agile methodology discussed in previous weeks teams select task managers and stand up leads, have stand up meetings with their project manager (instructor) each day, track all progress in Trello with user stories, and whiteboard site flows and entity relationships. Projects are demoed to project managers at the end of the week.

In addition to all of this, students are learning how to perform user authentication in Rails using session data and controller filters. Advanced validations for model classes are also discussed, and the bEtsy project provides several opportunities for using custom validations.

### Learning Goals
- Long-term project development with the Agile methodology 
- Different team member roles (task manager, stand up leader, project manager)
- Password-based user authentication in Rails
- Authorization of specific actions/routes in Rails
- Building custom validations for advanced model designs

### Resources
- [User Authentication in Rails (1)](../topic_resources/rails/rspec-with-rails.md)
- [User Authentication in Rails (2)](../topic_resources/rails/rspec-with-rails.md)
- [Advanced ActiveRecord Validations](../topic_resources/rails/custom-validators.md)
- [Rails Controller Filters](../topic_resources/rails/controller-filters.md)
- [Rails View Methods](../topic_resources/view-methods.md)

### Projects
- [bEtsy](https://github.com/Ada-C4/betsy)

## Week 12
Week 12 finishes up the first team project for students. Within each team a different set of students take on the Task Manager and Stand Up Leader roles, but teams retain their previous Project Manager (instructor). Emphasis this week is on getting to a "feature complete" state; improving code quality through testing and code coverage; and presenting a project demo to colleagues and stakeholders. 

Because we're continuing with the bEtsy project from Week 11, there is not much new lecture material. Crystal is presenting another CS Fundamentals lecture on the mergesort algorithm, and Kari will cover the use of GitHub Issues for contributing to open source projects by reporting bugs or feature requests.

### Learning Goals
- Long-term project development with the Agile methodology 
- Different team member roles (task manager, stand up leader, project manager)
- Collaborating on other people's/teams' projects using GitHub Issues

### Resources
- [GitHub Issues](https://guides.github.com/features/issues/)
- [Project Collaboration](../topic_resources/team-project-contributions.md)
- [CS Fundamentals (mergesort)](https://gist.github.com/sudocrystal/8578ad90cf9bf1189de1)

### Projects
- [bEtsy](https://github.com/Ada-C4/betsy)
