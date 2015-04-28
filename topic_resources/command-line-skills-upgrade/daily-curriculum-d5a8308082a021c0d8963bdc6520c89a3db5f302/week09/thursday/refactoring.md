# Refactoring in Rails

A best practice in Ruby is for each logic regarding an object should be defined
within the object class. Let's talk about what each major piece of rails meant to
handle.

- **Views**: The views within rails are meant to handle the creation of HTML.
- **Controllers**: Controllers are responsible for directing the flow of HTTP traffic
- **Models**: Models are meant to represent objects within the application

So let's define three questions you can ask to determine if the code within any
of these files is in the correct place.

- **Views**: Does the logic build HTML or determine which HTML is rendered?
- **Controller**: Does the logic determine what the HTTP response will be?
    - Is it an assignment for the view to use.
- **Model**: Does the logic have to due with the idea of the object?

Rules
-----
Try to meet all of the following rules. Occasionally they can be broken, but only if somebody else agrees.

1. Only call one method per line on any object in the view and controller (i.e. don't chain methods together)
1. Don't use more than a single method in a conditional (no actual comparisons of two objects)
1. Don't use operators (arithmitic, comparison, assignment) in views or controllers.
1. Don't do logic inside erb tags


Do not attempt to code keeping all of these things in mind. Just refactor!

Example
-------

Using [this test repo](https://github.com/Ada-Developers-Academy/refactor-example), we will explore things to refactor. Initial red flags

1. Chaining [multiple methods](https://github.com/Ada-Developers-Academy/refactor-example/blob/master/app/views/orders/index.html.erb#L9) with a block arg
2. [Logic within erb tags](https://github.com/Ada-Developers-Academy/refactor-example/blob/master/app/views/orders/index.html.erb#L14).
3. [Arithmitic within a view](https://github.com/Ada-Developers-Academy/refactor-example/blob/master/app/views/orders/index.html.erb#L20)
4. [Duplicated logic](https://github.com/Ada-Developers-Academy/refactor-example/blob/master/app/views/orders/show.html.erb#L8)
5. [More duplicated logic](https://github.com/Ada-Developers-Academy/refactor-example/blob/master/app/views/orders/show.html.erb#L16-L22)
