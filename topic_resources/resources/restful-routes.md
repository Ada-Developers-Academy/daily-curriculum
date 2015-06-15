# RESTful routes

REST (Representational State Transfer) is a pattern to help us provide a consitent method of accessing and managing our resources on the web. Many different languages and frameworks implement some sort of RESTful routing.

At its simplest, REST is a process in which a web server uses the combination of the requested __URL__ and __HTTP VERB__ to decide how to respond. The goal is a normalized, predictable strucuture for handling web requests. We've already started doing this with Sinatra; Rails formalizes this approach with a special file just for routes (we'll examine it in detail later).

## Here's some pseudo-code
__Assumption__: We've got a resource called `user` that can be recalled/manipulated by a unique identifier called `id`. In Sinatra, we'd represent getting a single instance of this resource with something like `get '/users/:id'`. 

We can extrapolate the entire RESTful suite of actions from this basic pattern. It'd look something like...

```
# Request         # Verb      # Response
/users/           GET         -> object: 'users', method: 'index'
/users/1          GET         -> object: 'users', method: 'show'
/users/new        GET         -> object: 'users', method: 'new'
/users/           POST        -> object: 'users', method: 'create'
/users/1/edit     GET         -> object: 'users', method: 'edit'
/users/1          PATCH       -> object: 'users', method: 'update'
/users/1          DELETE      -> object: 'users', method: 'destroy'
```

The combination of __VERB__ and __URL__ tell our web server (Sinatra, in this example) everything it needs to know to formulate an action and response. The methods we're calling on the `users` object follows a convention common to the Ruby community.
