[Google presentation](https://docs.google.com/presentation/d/1LLHcxk0xSg2lcMN0gJNtdHcSweAkJZf2RZUvS7HlUmE/edit?usp=sharing)

#Why Use Front-End Frameworks?

To understand why we use frameworks, and how we can use these tools,
we must first understand what a framework is. So, what is a framework?


##What is a framework?

A framework is a standardized collection of code you can use to facilitate
quicker, higher-quality app development.

Rails is a framework. Somewhere in the code that Rails provides, there are
functions that tell you what "routes" are and how to use your config file
to configure your site. You could write all of this code and information 
every time you write a new site, but that would take a very, very long time.
It's much faster and easier to use Rails.

Sinatra is a framework. It has a collection of functions that deal with 
many of the same competencies that Rails does.

Bootstrap is a framework, as well.


##Competencies covered by certain frameworks

|           | Database | Controllers | Models  | Views | JavaScript | CSS     |
|:---------:|:---------|-------------|---------|-------|------------|--------:|
| Rails     | Yes      | Yes         | Yes     | Yes   | Some       | Minimal |
| Sinatra   | No       | Yes         | Minimal | Yes   | No         | No      |
| Bootstrap | No       | No          | No      | No    | Minimal    | Yes     |
| AngularJS | Minimal  | Yes         | Yes     | Yes   | Yes        | No      |

##Conventions and Ways of Thinking

Since these frameworks are standardized groups of code, they also create
new conventions. Think about Rails and about .erb. There is nothing in the 
code that says that you need to use .erb, but it comes standard when you
create a new Rails app. Many developers choose to use haml instead, but 
the general culture and convention is erb.

Similarly, CoffeeScript files are automatically generated when you start
a new Rails app. Many programmers prefer JavaScript to CoffeeScript (Ellen 
is not one of them), and they can (and do) easily swap the languages out
for each other.

Rails as a framework emphasizes simplicity and sorting. Conventionally, 
Rails developers use human-readable variables. Most directories in Rails 
follow a specific syntax, and they are sorted by area of code (models, 
controllers) instead of by competency or feature (all User code together, 
for example). Additionally, in Rails, you typically want to have thin 
controllers with very little logic (though there has been a push recently 
away from big models and back towards big controllers). The Rails community 
has created a number of tools to evaluate the quality of Rails code, and 
many of these tools use the number of lines in a method but ignore the 
number of methods in a file. 

Rails focuses on simplifying model and controller logic. ActiveRecord, 
a great feature that comes with Rails, simplifies database work.

AngularJS as a framework emphasizes a few things, specifically, 
modularity and de-emphasis on CSS classes and IDs. AngularJS moves a 
lot of the logic into the controller. AngularJS projects tend to have a 
lot of more specific functions, and they usually minimize the number of 
methods in a file instead of the number of lines in a method. 

AngularJS focuses on simplifying JavaScript methods and creating simple,
direct logic for interesting and complex user convenience features. It
does not do much with direct data manipulation, and AngularJS apps
typically use an API to communicate with the database.

Due to this streamlined nature, AngularJS is sometimes criticized as
"not being JavaScript" or of adding strange complexity. Ellen disagrees
with these criticisms, but they are out there.


##So why use a framework?

Frameworks save a lot of time. They allow you to do different, complex
things very quickly. They can also create a conceptual framework and
series of conventions to guide you as you write your code.
