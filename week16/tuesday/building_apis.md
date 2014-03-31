Building APIs
-------------

**API** stands for *Application Programming Interface*, and it's applications communicate and share information with each other. When one app talks to another, they don't need the same user interface and image and JavaScript bits - they just need to pass data or commands back and forth, so we use plain text and JSON to accomplish this.

## What is an API?
In its most common usage, we're referring to the **public API** of an application. You've used these for the SeeMore project. Typically a public API allows anonymous users, or individuals who are not privy to the internal operations of an application, access to access some kinds of data, and to give the application a certain subset of commands. Many of you worked with the Twitter API to implement the following features into your SeeMore application:

+ fetch a user's followers
+ favorite a tweet
+ block a user from appearing on your timeline

These are all examples of working with a public API. A software company opens its API to the public so that other software developers can build applications that are powered by its service.

### Internal APIs

Imagine each class in your application as a separate application, a collection of individual little programs sending messages back and forth, asking each other to execute certain commands. This is the perspective most senior developers and those concerned with **application architecture** take towards the code. At this scale, we refer to the public methods of a class as that class's API. This view can help us identify the seams between different classes, where one class's responsibilities end and another's begin.

## Building Your API

Although its not 100% obvious, your Rails application is already an API. One application -- your web browser -- makes a request for some information. Rails generates a response that consists of HTML, and sends that data back to the browser. Its the *browser* that handles all the rendering and layout business.

## Resources
[API Basics and Building Your Own](http://www.theodinproject.com/ruby-on-rails/apis-and-building-your-own)


