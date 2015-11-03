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
