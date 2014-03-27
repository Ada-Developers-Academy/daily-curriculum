# ember-data RESTAdapter

The RESTAdapter is used to retrieve data from a RESTful JSON API. Ember.js's adapters make it easy to switch between data sources without needing to change the Ember.js application logic. To change to the RESTAdapter from your current FixtureAdapter, simply open the `main.js` and replace the name of the adapter

```js
App.Store = DS.Store.extend({
  adapter: DS.RESTAdapter
});
```

We will want to configure the RESTAdapter a bit, using the `.extend` method we can set the specific host:

```js
App.Store = DS.Store.extend({
  adapter: DS.RESTAdapter.extend({
    host: "http://localhost:3000"
  })
});
```

Remove your Fixture data in the models, given a compatible api, this just works!

### The API

The API could be coded in any language and framework, as long as it returns a
compatible JSON response it will work. The default formatting of the response
should be:

```json
{
  "class_name": {
    "id":   1,
    "attr": "value",
    "attr": "value"
  }
}
```

For example:

```json
{
  "product": {
    "id":   1,
    "name": "Gum",
    "cents": 199
  }
}
```

And for a collection, the format should be the same but wrapped in an array

```json
{
  "product": [
    {
      "id": 1,
      "name": "Gum",
      "cents": 199
    },
    {
      "id": 2,
      "name": "Shoe",
      "cents": 7999
    }
  ]
}
```

For a has many association we would add the key of the association name, with a
value of an array of ids.

```json
{
  "cart": {
    "id":   1,
    "items": [1,3,10]
  }
}
```

Similarly, for a `belongs_to` it would the name of the association with a single id
value:

```json
{
  "item": {
    "id":   1,
    "product": 2,
    "cart": 70
  }
}
```

This is an easy response to create using jBuilder and rails. 

### CORS

Another hurdle with javascript and a remote server is a security issue called 
"same origin policy", which says that to make a javascript request to a remote
server, the remote server's host, port, and protocol must match the current pages.

This is because your browser has access to your cookies, if I'm on website x, that can make javascript requests to Facebook, and I was logged into Facebook, the request could be authenticated as me.

The solution is to use CORS (Cross-Origin Resource Sharing), which is a header
you can set in your server's response to specify a host, port, and protocol that you do want to allow.

In rails the easiest way to do this is the [rack-cors gem](https://github.com/cyu/rack-cors)
To get started add the gem to your gemfile then bundle:

```rb
gem "rack-cors"
```

The gem has great documention, but the simplest way to allow requests is by putting the following in the class definition of `application.rb`

```rb
config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options, :delete]
  end
end
```

Now, any remote application can make ajax requests to this application.

### Format

Since this is an API we will always want to return json, a way to default the format of all requests to JSON is by setting it on each route in the `routes.rb` file. You can wrap all of your API route in a `defaults` block,

```rb
defaults format: :json do
  resources :products
  get "/cart", to: "cart#show"
end
```

