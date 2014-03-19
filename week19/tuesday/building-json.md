# Building JSON w/jBuilder

## Creating an API

First we'll setup a new app:

```bash
rails new user-api -T -d postgresql
cd user-api
```

I have to modify my database.yml to remove the usernames and passwords, but this will depend on your setup.

```bash
rake db:create
rails g model user username email
rake db:migrate db:test:clone
rails g controller users
```

Now we have an application with a `User` model as well as a `UsersController`

## jBuilder

The `jbuilder` gem is included by default in Rails 4, so we can just use it.

jBuilder is a templating system for JSON, it allows us to create "views" to build JSON within, also giving us the ability to use view helpers as well as conditionals.

To use jbuilder we simply create view files with the extension `.json.jbuilder`
this is the equivelent to ruby/HTML's `.html.erb`. With this, when a JSON request is received our application will look for the matching JSON file automatically. So the `UsersController` `index` action will render the file `app/views/users/index.json.jbuilder`.

Lets add this route, action, and file:

```rb
get "/users", to: "users#index"
```

```rb
def index
  @users = User.all
end
```

```bash
touch app/views/users/index.json.jbuilder
```

Now if we open http://localhost:3000/users we will see an error:

```
Missing template users/index, application/index with {:locale=>[:en], :formats=>[:html]
```

This tells me that it looked for an HTML file, html is the default, we have to 
override the default by declaring in the routes that these routes are JSON:

```rb
defaults format: :json do
  get "/users", to: "users#index"
end
```

Now refresh the browser and we should see the JSON `{}`. Next open the `index.json.jbuilder`
Here is where we will define our json, let's start with a quick test, put

```rb
json.foo :bar
```

And refresh. You should see `{"foo": "bar"}` in your browser. In the jbuilder 
template `json` is a helper method that allows you do add a key using a dot syntax
`json.anything` will create a key of `anything`, the argument that we give it will
be the value of that key. So if we wanted `{"users": []}` we could put:

```rb
json.user []
```

The jbuilder file is a view, just like an `html.erb` file, this means we have access
to the instance variables from the controller, we can also put in loops, conditional
etc. 

We can also nest attributes by using blocks, so if we wanted something like
`{"users": {"id" 1}}` we could do:

```rb
json.user do
  json.id 1
end
```

We can also nest using an array:

```rb
json.user @users do |user|
  json.id user.id
  json.username user.username
  json.email user.email
end
```

Now we are creating a key of `users`, with a value of an array where each element
represents a single user as json. There is another, short hand, way to do this:

```rb
json.user @users do |user|
  json.extract! user, :id, :username, :email
end
```

[jBuilder example](https://github.com/Ada-Developers-Academy/jbuilder-example)