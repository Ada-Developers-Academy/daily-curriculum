[Google presentation](https://docs.google.com/presentation/d/1vOMkrETd2qYtjYGgb_ZoCi3m71PjnvPof-yQjbujhl4/edit?usp=sharing)
[Recording](https://www.youtube.com/watch?v=yMSAm7hCCqY)

#Intro to AngularJS

On the AngularJS doc pages, AngularJS is described as "A Superheroic MVW 
JavaScript Framework." I’m not sure what they mean by “superheroic” (unless 
they’re just talking about how cool it is). MVW stands for Model View 
Whatever; AngularJS is incredibly flexible and gives you a lot of options 
for customization and adaptation. Some people create models in AngularJS with 
their own attributes, methods, and relations; others just use it to display
data retrieved by an API.

The framework was created by Google, and Google really likes it. They’ve 
created a lot of support structures to encourage people to use it, including 
the tutorial you’ll be doing in class next week which has text, video, and 
git diffs.

AngularJS is a front-end framework, which in this case means that it doesn’t 
really interact with your data directly at all. Instead, the user interacts 
with the AngularJS app directly, which then communicates with some other back-end 
service, which can be an app that the AngularJS is integrated with or an API. 

I find it helpful to think of AngularJS as a “shallow” framework: the AngularJS 
section of your app should just be a shallow scrape across the top of the app, 
encompassing your JavaScript, your views, and some routing and controller logic 
to serve up these views.

AngularJS is very modular--and in fact, you will be creating a lot of modules 
as you work on your project. This means that many of the pieces of your app will
be built in small, isolated chunks that you could, in theory, pluck out of your
app and put somewhere else. In practice, this is pretty hard and doesn't happen
often, but the structure and theory is there, whereas it's hard to image plucking
a single feature or chunk of a Rails app and trying to plug it into a new site.

There's actually some heated debate in the AngularJS community about structure
and modularity. On the one side, there are people who structure their app like
a Rails app (or another MVC app)--you have an app directory, and inside your
app directory, you have a controller directory, a view directory, etc. Everything
is separated by type.

The other side of this debate prefers structuring their code in modules. If you're
creating a blog, for example, you might have a blog directory, and inside this blog
directory you might have blog.js, blog.html, and blog.css. I (Ellen) wholeheartedly 
prefer the modular approach, as I think it is more intuitive and in the spirit of
the framework, but I'll be teaching the MVC structure, since it is more popular 
and you will likely encounter it in your career. In my personal projects, however,
I write with the module structure.


##AngularJS moves and improves logic

AngularJS moves and improves the logic flow of JavaScript code. JavaScript does 
a lot of amazing things, but it was created in 10 days by people who did not 
realize that it would soon become an industry standard and a huge part of web 
development, so not all of the logic in JavaScript is smooth or useful. There are 
a lot of strange quirks that JavaScript developers have to learn how to work around.

If you think about regular JavaScript, creating a simple click event is a little 
messy and hits a lot of different parts of your code. First, it relies on a CSS 
class as an identifier. Then, you add a click event to it. In order to add the 
click event, you need to look through the DOM to find all instances of the CSS 
class to add that handler--but before you do that, you need to make sure that the 
DOM is loaded, which means you have to pause your JavaScript long enough to actually 
load the DOM.

This might not seem that significant, but one of the really cool parts about 
JavaScript is that it runs asynchronously. It doesn’t wait around for everything 
to finish and load, which means it’s really fast and really slick. Pausing your 
JavaScript functions until your window loads is really slow and clunky.

Once the DOM loads, the event handler is added. Then, when a user clicks on that 
class, you check and see if there are any attached event handlers. If there are, 
the appropriate function runs. If you add any more elements to the DOM with this 
same class after the initial load--like in Lister, where you added a list item, 
and then added another form once that item was created without refreshing the page, 
you needed to add a new event handler all over again.

This means that having a single-page application, where the website and the database 
respond to the actions that you are taking but do not refresh each time, is really
complicated and takes a lot more effort and maneuvering than a multi-page site.

Your JavaScript view code probably looks like this:

    <div class="button">Say hi!</div>

and the JavaScript page looks like this:

    <div class="button">Say hi!</div>

    <script type="text/javascript">
        function init() {
          $('.button').click(function() {
            alert('Hi!');
          });
        }
        window.onload = init;
    </script>

In AngularJS, on the other hand, all of this logic is moved to the view and 
the controller. 

Controllers in AngularJS work a little differently than Rails controllers. 
While Rails controllers typically assign some instance variables and return 
or render something (like JSON or an HTML view), AngularJS controllers
don't return a view. Instead, they house instance variables and functions 
you can use to alter those variables. We'll talk more about controllers
next week.

If you want to add a click event to a div in AngularJS, you go to the view, 
pick your div

    <div class=”button”>Say hello!</div>

and add an ng-click, so the div looks like this:

    <div class=”button” ng-click=”sayHi()”>Say hi!</div>

Then, you go to your controller and create a method called sayHi.

    <div class=”button” ng-click=”sayHi()”>Say hi!</div>

    <!-- controller script follows -->
    $scope.sayHi = function() {
        alert(“Hi!”);
    }

Now, any time you click on that div, it hits the controller, looks for the 
method you specified, and runs the method.


##New Markup

Part of how AngularJS streamlines the logic for dynamic, interactive sites is by 
adding new markup to the view. There are two main kinds of new markup: curly braces 
and directives.

###Curly braces

Curly braces are pretty simple: they return the result of the code inside the curly 
braces. Rails uses some very similar logic in .erb files: `<%= foo %>`. Let’s take a 
quick glance at what that looks like.

If I put `2 + 2` in my html, all I see on the webpage is essentially a string, 
‘2 + 2’. The code here isn’t evaluated, it’s just shown. However, if I put it 
in the curly braces in an AngularJS app, so I type `{{2 + 2}}`, the app will 
actually evaluate the code inside the curly braces and display the result--so 
here, I would see "4" instead of "2 + 2" You can use variables, custom functions, 
and so on here, too.

You'll see and use this more in the activity next week.

###Directives

Directives are a particular AngularJS kind of attribute in your otherwise 
regular HTML. Just like you can add an href to an anchor tag which your HTML 
then turns into a link, which looks like `<a href="foo">`, you can add 
ng- directives to your Angular app which will then run the appropriate logic. 
You add these to your HTML just like you add regular HTML attributes--you take a 
view element, like a `<div>`, and add the attribute name like `ng-foo`, an equals 
sign, and then, in quotation marks, what you want that attribute to equate to. 
So my div might look like `<div ng-foo="bar">`.


There are a heck of a lot of different directives straight out of the box, and 
we’ll go over several of them over the next two weeks, but right now we’ll
take a brief look at two of them: `ng-model` and `ng-click`.

####ng-model

Let's look at the following code:
`<input ng-model="searchTerm"/> {{searchTerm}}`

`ng-model` assigns the value of the element to a variable. In this case, the value
is what I put in my `input` code: it’s the value the user is inputting. The variable 
that this value is being assigned to is `searchTerm`. `searchTerm` is being displayed
to the user in the curly braces. When the user puts something in the input--say, they
type "help"--the word "help" will immediately be displayed as they type it to the right
of the input. If `searchTerm` already exists, this new value will replace the old value. 
If it doesn’t already exist, a new variable will be created.

####ng-click

Let's look at the following code:
`<button ng-click="alert('Success!')">Did it work?</button>`

`ng-click` runs the code to the right of the equal sign when that HTML element is
clicked. Sometimes, this is evaluated entirely in the view, like in this instance;
often, it is a custom method that you define in your controller. In this case, when
you click on the button, you see an alert.

####Custom directives

In addition to the standard directives that come with AngularJS, you also have the 
ability to create custom directives. These directives can do a lot of different things; 
I have written directives that run a method when you hit the enter key, or that upload
a file to AWS when a user uses a file select. They can be difficult and confusing
at first, but they give you a lot of control over your code.


##Two-Way Data Binding

Now, you may have noticed that when we updated the value of our `searchTerm` model 
on the other page, we were able to see the results of that change immediately in the 
view as it updated without adding a lot of complicated JavaScript, but simply by 
displaying the searchTerm model. This works through this important concept in Angular 
called two-way data binding. 

Many other frameworks, like Rails, use one-way data binding. One-way data binding means
that data is passed to the view one time; it isn't updated regularly, and user input
changes the display in the view but does not change the model or the data itself until 
either the view is changed or an ajax method is called. There isn't a regular feedback
loop.

Think about a simple Rails app that has a split screen. On the right side of the screen,
you have blocks of different colors--red and green and pink and blue. On the left side
of the screen, you have an edit partial for those blocks where you can change the color
of each block. If you wanted to see those colors change in real time, you'd have to 
add some JavaScript to tell it to update when the app changes; Rails by itself can't
show that change when it happens, because it has one-way data binding and it doesn't 
continually update that value as it changes.

AngularJS, on the other hand, updates these values constantly. If you change the value
of the color on the left side of the screen, the color changes on the right side as well,
instantly. It also takes a lot less code to make this change. This is due to the two-way
data binding.


##Takeaways

There are many more changes and features to AngularJS, but it would be overwhelming 
to look at them all right now. We looked at two of the big-picture changes. Think 
about the different workflow and about two-way data binding as you begin to play with 
AngularJS in the AngularJS phonecat tutorial.
