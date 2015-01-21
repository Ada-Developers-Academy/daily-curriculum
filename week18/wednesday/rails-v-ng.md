[Google presentation](https://docs.google.com/presentation/d/18WMlyMNLJD5fay0CnB_2al8bB8X0DwCrDyyQWI9TDfg/edit?usp=sharing)
[Recording](https://www.youtube.com/watch?v=FnR6EgLlbfs)

#Rails vs. AngularJS

So, I know I’ve asked you to draw some comparisons between Rails and AngularJS as you work on the tutorial, but I thought it might be useful to explicitly talk about some of the similarities and differences between the two.

##Models: Rails
Definition of models in Rails typically look like the following:

    class Post < ActiveRecord::Base

Models are explicit; you must greenlight attributes in models. In Ruby by itself, you do this through your `attr_accessor` and in your initialization block; in Rails,
these attributes are defined through the migration. You can have a model that is 
not directly connected to your database, and you can define "virtual attributes"
that do not directly map to a line in your database, but that is unusual behavior
in a Rails app. For most most cases, you will explicitly define your model's
attributes.

Ruby models are typically well-defined, meaning the edges surrounding them are clear
and the contents of the model are also clear. You can call `.methods` to list all
methods that are available on that object and `.attributes` to list all attributes
that are a part of that object.

Models can also be thought of as a fixed type: you cannot arbitrarily decide
that an instance of a model `Post` is now a model `Comment` and that it has
`Comment` methods and attributes available. It owns its own type and methods,
and these are not easily changed.

In Rails, your model also inherits from ActiveRecord, which means that it has
relatively direct interaction with its data source.

###Data source: Rails
Typically, a Rails app has a local database that it uses through relatively
direct queries via ActiveRecord. Database queries run locally on the local server,
and are typically local queries that do not need to run over the internet--for
example, if you have a controller method that updates a `Post` instance, then
the `Post.update` method runs locally without hitting the internet (barring
really big apps/servers).

It also directly interacts with your models in Rails. If you generate a 
Posts table in your database in Rails, your Posts model will know about the
attributes you created in that database.


##Models: AngularJS
AngularJS models look very, very different.

AngularJS models are values stored in variables on the scope. They do not
directly interact with the data at all, either by changing the data or
by defining the shape of the variable. By "defining the shape of the variable,"
I mean that the data does not define persistent attributes on that variable.

They are not a fixed type, and they can be changed on the fly; you can add 
attributes and functions arbitrarily after the instance has been initialized 
(meaning after the variable has been created).

Because they change so easily and because you can arbitrarily change them
without much backlash, they can be described as "fuzzy." The line between
models and variables is blurred.

Believe it or not, although this sounds kind of whackadoodle, it gets really
amazing; you can temporarily add an attribute to a model directly instead of
saving them all as separate variables, and you can do this without altering
the data at all.


###Data source: AngularJS
AngularJS never actually has a database. Instead, AngularJS accesses and
manipulates data through API calls. This is true if you are getting data 
from a 3rd party/separate API, and it's true if you are getting data from a
local API that your AngularJS app is integrated into.

Because you always access data through the API, data queries from AngularJS
make remote queries by default. They look very similar to regular Ajax
queries.

Since all contact with the data comes through API calls, there is no direct 
connection between AngularJS models and your data source in AngularJS.

##Controllers: Rails
Rails controllers typically have one controller per area of the app. Sometimes
(though not always) this means one controller per feature or model. Controllers
have one method for each view or route, and they also have other helper
methods, like a method that handles your parameters.

Typically, Rails controllers are responsible for a few different areas of logic.
They return or render as a response to the request made; frequently (though
not always) this is HTML that is rendered for the user, or JSON consumed by 
another application.

Controllers take params on default and deliver different information to the 
view based on these params. They also aggregate instance variables, indicated
with the `@` symbol, which are shared with the view.

The controller responds to routes and the server. That is what starts a function
in the controller running, and otherwise, controller functions do not actively
do things or make changes.


##Controllers: AngularJS
AngularJS controllers are pretty different. AngularJS apps typically have one
controller per view, including partials; this does not mean one controller
per file, however. Typically, you'll have a different file for each feature
or model--I might have a `posts.js` file, and in this file I might define
my `PostController` (for my show page), my `PostsController` (for my index
page), my `EditPostController`, and so on.

These controllers frequently end up with many different functions that act
like helper functions.

Typically, AngularJS controllers hold on to some different logic. They
initialize instance variables and functions that are used by the view; 
these variables and functions are identified with `$scope`. It responds to
events in the view; the view typically determines which controller you use,
via the `ng-controller` directive, and many events in the view like click 
events (`ng-click`) or keypress events (`ng-keypress`) trigger functions
that are defined in the controller.

Frequently, the controller has the code that we use to pull data from an API,
though this logic is sometimes held in services, factories, or custom
directives; don't worry too much about those right now, since the distinction
between them can be kind of confusing.


##Views: Rails
Rails renders some Ruby in the view with .erb or .haml. In .erb, we use 
`<%= rubyCode %>` to explicitly render ruby to the view. Rails views should
only use some visualization or rendering logic, like each loops or if blocks,
but it should not include any real data manipulation. For example, putting
`<% foo = Bar.find(1) %>` in your view is pretty bad Rails structure. You want
to move logic out of your HTML. Your Rails views don't include event response
logic, either.


##Views: AngularJS
AngularJS renders some JavaScript and AngularJS in the view with directives
and curly braces. Your AngularJS view logic includes logic for visualization
and rendering, just like Rails, including `ng-if` and `ng-repeat`. It can specify
which controller should be used. It also includes a lot of event logic and
specifies how you should respond to events.

AngularJS streamlines logic in your HTML and your view; it attaches event
handlers directly to parts of the DOM, and it specifies what the response
to this event should be. Typically, this response is a function in the controller.


##Scope: Rails
Rails scope is pretty well fixed. Both the controller and the view have
three main scopes: the local scope, `foo`, the instance scope, `@foo`, and
the global scope, `$foo`. The instance scope is shared between the view and
the controller and the global scope is shared across the entire app. Global scope
is typically thought of as Bad News Bears and is used infrequently. Instance
functions aren't really a thing in Rails.


##Scope: AngularJS
AngularJS scope has a little more wiggle room, and in some rare instances--like
when you create a custom directive--you actually inject the scope as a parameter.
Don't worry about that a whole lot right now, though.

Global scope exists in AngularJS, but I have never really interacted with it.

Controllers have two main scopes, a local scope `foo` and an instance scope,
`$scope.foo`. Views have one main scope, a local scope, `foo`. Variables in 
the controller instance scope is the same as the view main scope, so `$scope.foo` 
in the controller is the same as `foo` in the view.


##Load order: Rails
Rails loads synchronously. This means that when you load a Rails app--and in
particular, when you make an API call or load a script in Rails--it waits until
a line of code is finished executing before it executes the next line. This means
that out of the box, it will never run two API calls at the same time or run two 
lines of Ruby code at the same time.

This means that when Ruby loads views, it loads them very slowly; it loads all of
the DOM, all of the JavaScript, all of the views, and all of the data one by one.

##Load order: AngularJS
AngularJS loads asynchronously. This means that when you load an AngularJS app,
it starts running the top line of code in a file but does not wait until that line
of code is finished executing before it begins executing the next line. Typically,
this is only an issue with particularly slow calls, like API calls. This means
that you might run two or more API calls at the same time.

This means that when AngularJS loads views, it loads them very quickly.