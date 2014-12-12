Building APIs
-------------

**API** stands for *Application Programming Interface*, and it's one way for applications to communicate and share information with each other. When one app talks to another, they don't need the same user interface and image and JavaScript bits - they just need to pass data or commands back and forth, so we use plain text and JSON to accomplish this.

## What is an API?
In its most common usage, we're referring to the **public API** of an application. You've used these for the SeeMore project. Typically a public API allows anonymous users, or individuals who are not privy to the internal operations of an application, access to access some kinds of data, and to give the application a certain subset of commands. Many of you worked with the Twitter API to implement the following features into your SeeMore application:

+ fetch a user's followers
+ favorite a tweet
+ block a user from appearing on your timeline

These are all examples of working with a public API. A software company opens its API to the public so that other software developers can build applications that are powered by its service.

### Internal APIs

Imagine each class in your application as a separate application, a collection of individual little programs sending messages back and forth, asking each other to execute certain commands. This is the perspective most senior developers and those concerned with **application architecture** take towards the code. At this scale, we refer to the public methods of a class as that class's API. This view can help us identify the seams between different classes, where one class's responsibilities end and another's begin.

### Ask "What does the user want to do?"

One of the more common failure of APIs is to simply expose the inner workings of models or controllers. Often this leads forcing users to understand the inner complexities, tangled dependencies, and specialized terminology of your particular application.

We can avoid this problem by asking from the very first, "What does the user want to do?" By putting ourselves into their shoes, working to question the assumptions and vocabulary of our audience, we can craft friendly, usable APIs that can lead to more interesting implementations than APIs that are artificially limiting their use cases through poor design.

## Building Your API

Although its not 100% obvious, your Rails application is already an API. One application -- your web browser -- makes a request for some information. Rails generates a response that consists of HTML, and sends that data back to the browser. Its the *browser* that handles all the rendering and layout business.

Typically, our Rails APIs will strive to be RESTful, and return data formated as JSON. There are other valid formats, of course - XML is common in some use cases - but we'll be focusing on JSON for this.

When we want a Rails app to return JSON instead of HTML, its fairly easy to tell the controller to do so. The same controller action can return different formats depending on whether your user is making a request from a browser or an API call from JavaScript. By default, Rails assumes you want HTML, but the app can determine which type of request is being made based on the extension.

Let's take a look at this with [hits_of_the_adie](https://github.com/Ada-Developers-Academy/singles-demo) demo app. From the command line, we'll use *curl* to fetch the `#show` action for the Singles controller:

```
# returns HTML by default
$ curl http://localhost:3000/singles/1
```

Here's the result in our log:

```
Started GET "/singles/1" for 127.0.0.1 at 2014-04-04 10:53:57 -0700
Processing by SinglesController#show as HTML
```

Now let's make the same request, but append `.json` to the the URL.

```
# same controller and action, asking for JSON
$ curl http://localhost:3000/singles/1.json
```

Here's the result in our log for the JSON request:
```
Started GET "/singles/1.json" for 127.0.0.1 at 2014-04-04 10:57:03 -0700
Processing by SinglesController#show as JSON
```

## Rendering HTML, JSON, and XML

Adding the ability to render different response formats is a simple thing to add to our controller. We accomplish this by using the `responds_to` method.

```ruby
class SinglesController < ApplicationController
  def show
    response = { title:  @single.title,
                 artist: @single.artist,
                 release_date: @single.release_date }

    respond_to do |format|
      format.html
      format.json { render json: response }
      format.xml  { render xml: response }
    end
  end
end
```

`respond_to` passes a format object to the block, to which we assign various rendering options. Notice that we don't have to do anything for HTML, as Rails automatically knows to render the default template, however we *could* specify different behavior if we had a reason to.

We're using the `render` function to define what our response will look like. It is aware of a wide range of formats. When you pass it the key :json, it will call #to_json on the value, in this case our hash of specific attributes from the `@single` object. We could have simply passed it the `@single` object itself, like so:

```ruby
respond_to do |format|
  format.html
  format.json { render json: @single }
  format.xml  { render xml: @single }
end
```

Doing so would have transformed the object into a JSON hash, with attribute names as the keys and the value of the attributes as the values in the JSON.

## Response Codes

We've built a simple API that responds with some data. We could let the consumer of our API parse that data to figure out if their request was successful or if there was an error of some sort, but that seems like cumbersome for them. Instead, we can use HTTP status codes to provide a quick and easy way for our API's users to see the status of their request.

To set status code in your controller, just pass `:status` to our render method.

```ruby
respond_to do |format|
  format.html
  format.json { render json: @single, status: :success }
  format.xml  { render xml: @single,  status: 200 }
end
```

Notice in the example above, I used both `:success` as well as the official numeric value of 200 to inform the consumer that the request was a success. I tend to use the built-in Rails symbols for this, as they're more explicit, however its good to know at least the most common HTTP status codes.

+ 200 - :ok
+ 204 - :no_content
+ 301 - :moved_permanently
+ 400 - :bad_request
+ 403 - :forbidden
+ 401 - :unauthorized
+ 404 - :not_found
+ 410 - :gone
+ 422 - :unprocessable_entity
+ 500 - :internal_server_error

### Magic!
Just like that, we've built a very simple API. Naturally, it can get quite a bit more complicated, but this is basically all there is to it. See the resources listed below for further details.

## Resources
[API Basics and Building Your Own](http://www.theodinproject.com/ruby-on-rails/apis-and-building-your-own)

[Building and documenting API in Rails](http://www.amberbit.com/blog/2014/2/19/building-and-documenting-api-in-rails/)

[Building a Platform API on Rails](http://mt.gomiso.com/2011/06/27/building-a-platform-api-on-rails/)

[HTTP status code symbols for Rails](http://futureshock-ed.com/2011/03/04/http-status-code-symbols-for-rails/)
