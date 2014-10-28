# Routing 102

Order
-----

Rails routes are matched in the order they are specified. This can present a problem when a wildcard is used.

```ruby
get "/products/:id", to: "products#show"
get "/products/new", to: "products#new"
```

In this example, when rails receives a request to "products/new", the routes will be matched top to bottom. Both of the routes above match "/products/new"!
Rails doesn't know what `:id` means, it's not looking for an integer,
it's just looking for anything, including the word `new`. "products/new"
in this case will route to the `ProductController#show` action. For the
desired routes reorder the declarations

```ruby
get "/products/new", to: "products#new"
get "/products/:id", to: "products#show"
```


REST
-----

Representational state transfer (REST) is an architectual style. This is a recommendation for the structure and style in which
a resource (ruby object) can be represetned and managed through a web server.

The core of this idea can be described through routing. We'll look at an example if we have a `Market` object we want to represent through a web server.

|PATH        | METHOD| DESCRIPTION|
|:----------|:-----:|:-----------|
| /markets       | GET    | Retrieves a collection of market objects|
| /markets       | POST   | Creates a market object on the server. |
| /markets/:id   | GET    | Retrieves an  individual market object through an identifying attribute, givin in the url path.|
| /markets/:id   | PUT    | Updates an individual market object through an identifying attribute, givin in the url path.|
| /markets/:id   | DELETE | Removes an individual market object through an identifying attribute, givin in the url path.|

You can see that many actions can be performed on a market object using only two paths.
The paths represent the scope of the objects to operate on and the HTTP method indicates what type of action should be performed.

**Common non RESTful routes**

|PATH        | METHOD| DESCRIPTION|
|:----------|:-----:|:-----------|
| /markets/new | GET    | Shows the form to create a resource |
| /markets/:id/edit | GET    | Shows the form to edit a resource|

Named Routes for REST
------------

Since the standard RESTful resource only requires to paths, all five actions can be represented by just the two named routes.
The conventional route names for a RESTful resource would be `markets_path` and `market_path`

The `new` (and `edit`) pages of a resource are not considered part of REST, because those pages are not
actually performing an action on the object, they are only setting up the client to be able to send a RESTful request (like POST or PUT)

Resources
---------
Rails routes has a magic method

```ruby
MediaRanker::Application.routes.draw do
  resources :albums
  root to: "home#index"
end
```

This `resources :albums` line is adding all of the RESTful routes, it is equivelant to the following:


```ruby
MediaRanker::Application.routes.draw do
  get    "/albums"          , to: "albums#index",   as: :albums
  post   "/albums"          , to: "albums#create"
  get    "/albums/:id"      , to: "albums#show",    as: :album
  patch  "/albums/:id"      , to: "albums#update"
  put    "/albums/:id"      , to: "albums#update"
  delete "/albums/:id"      , to: "albums#destroy"
  get    "/albums/new"      , to: "albums#new",     as: :new_album
  get    "/albums/:id/edit" , to: "albums#edit",    as: :edit_album

  root to: "home#index"
end
```
--------------

![Rails Request Cycle](../../week06/resources/rails-request-cycle.jpg)
