#Refactoring Our Apps

##What do we look for when we refactor?

There are two main things we look for when we're thinking about refactoring: 
code flow, and redundancy.


###Code flow

One of the first things we look at when we're refactoring our code is the flow
of the code. This means a few things, but it mostly focuses on two things: are
our files structured by competency, and is it a structure that makes sense?


####Competency

Let's look at competency first. Separation by competency normally means the 
same sorts of things that it means in Rails: are our controllers separated 
into different views or chunks of logic that make sense? Do we have partials 
for our views and forms?

For a more concrete example, let's think about our blog. Let's say that we 
want our end product to give us a post index, a post show, a post edit, a post 
create, a tag create, a tag index, a tag show, etc. Right now, we have some of 
this functionality, but our blog has one main controller with a lot of logic 
in it and a couple of views, but most of our actual working code lives in 
`layout.js` and in `home.html`. That doesn't make a whole lot of sense, does 
it? 

Instead, it would make more sense to create one big layout with our header and 
footer, and then some partials for the rest of that logic--a tags index 
partial that we can render as a sidebar on our blog, a blog index that shows 
all of the posts, a new tag form that we can render under or above the tag 
index...by focusing on separating out this logic by creating partials for the 
different pieces (and consequently, creating controllers for these different 
pieces), we cut down on redundancies.

At the same time, think about structure. As we create more small pieces--lots 
of small controllers for our partials--we can work on making sure our 
structure is logical and competency-based, as well. Instead of one giant,
bloated controller that controls our whole app, and instead of housing all of 
our controllers in a `controllers.js` file, create controller files and 
modules based on area of competence, such as `posts.js`, `tags.js`, and 
`static.js`. 

At the same time, as yourself if the directories and names/locations of files, 
etc. make sense. For example, we have a file called `layout.js` that holds a 
controller called `homeController`. Does that make a lot of sense? No, not 
really. Do we really need a `home.html`? We might want a landing page, but 
it's more likely that we'll actually want the posts index page to be our 
landing page. It's worth thinking about moving some of these files around to 
better directories, or renaming them.

So ask yourself, does my file structure make sense? Are things in the places 
they should be? Do I think that similar things are housed together--posts with 
other posts, tags with other tags, etc.?

The advantage of the modular nature of AngularJS is that it should actually be 
pretty easy to rename and redo things. Just remember, particulary if you're 
renaming or adding files or modules, that you need to adjust any/all relative 
paths and injections--so update the `script` tags in `index.html`, update the 
modules you're injecting in `app.js`, and update the relative pathways to your 
`templateUrl`s in `app.js`.


###Redundancy

Redundancy is the big indicator of a need to refactor. What code are we 
repeating that we could refactor out? Any time you're repeating a few lines of 
code in a lot of different places, you should look and see if you can refactor 
that chunk of code. Sometimes, that update means writing a function that you 
call in your controller. Sometimes, though, you want a helper method that can 
be easily added to different controllers throughout your site. To do that, you 
might want to create a directive, a factory, or a service.