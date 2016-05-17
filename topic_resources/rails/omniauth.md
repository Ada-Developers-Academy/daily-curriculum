# Authentication w/ OmniAuth

OmniAuth is a gem that standardizes the authentication process using 3rd party providers. OmniAuth supports a ton of providers, a quick search shows over 150, some of the popular providers are:

- Twitter
- Facebook
- Github
- Heroku
- LinkedIn
- Netflix
- Paypal

In this lesson we will be creating a rails application that uses OmniAuth to authenticate new and returning users using Github.

### Learning Goals
- What is a provider?
- What is the difference between OAuth and OmniAuth?
- What is an environment variable?
- What is the flow of data from the provider through our application?

### OmniAuth

The `OmniAuth` gem provides pretty much everything you need to use these services, starting with adding a couple routes to your application:

- `/auth/:provider`
- `/auth/:provider/callback`

In both of these examples `:provider` is a named parameter that will equal the name of the service we are using, in this example it will be `github`. These two routes in our application are how we start and end the authentication interaction with the provider, sending the user to `/auth/github`, will start the authentication process, when Github is finished authenticating them, they will be sent back to our application to the route `/auth/github/callback`

![OmniAuth Dance](../resources/omniauth-dance.png)

### Getting started

Enough with talking, lets implement this into a quick application. Head over to your sandbox record app...

Open the Gemfile and add some gems:

```ruby
gem "omniauth"
gem "omniauth-github"
```
Then `bundle install`, you notice that we have a specific gem for Github. Each provider has a small gem to add the functionality for that specific provider.

### Configuration

Each provider requires you to provide some credential for your application, so they can keep track of which website is authorizing which user. We can login to [Github](http://github.com) and register a new "application" here [https://github.com/settings/applications/new](https://github.com/settings/applications/new)

![Github Application Registration](../resources/github-application.png)

After registration you will be given a `client id` and a `client secret`:

![Github Application Credentials](../resources/github-credentials.png)

**Note:** These are essentially passwords to your Github account, keep them safe, never post them in public places or commit them in git.

Now that we have our credentials, we can configure our rails application, we will do this in an initializer file, initializers are files that run as a rails application starts, any file inside of `config/initializers/` are loaded.

Inside of this initializers file, add this configuration:

```ruby  
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, YOUR_CLIENT_ID, YOUR_CLIENT_SECRET
end
```

We don't want to commit our id or secret to github, so we can use what is called
an "environment variable". Basically there is a constant called `ENV` which is a hash
of data read into memory when ruby was loaded.

We can use a gem called [dotenv-rails](https://github.com/bkeepers/dotenv) to help us
manage our environment variables.

```ruby
#Gemfile
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
end
```

Create the hidden file for the environment variables:
```bash
touch .env
```

```ruby
#omni/.env
GITHUB_CLIENT_ID: fd6XXXXXXXX
GITHUB_CLIENT_SECRET: y6wXXXXXXX
```
This will load these key/values as environment variables in our rails app, so now the `config/initializers/omniauth.rb` can be changed to:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]
end
```

Whew... done with configuration

### Implementing Users

Boot your rails app and go to `/auth/github`. Amazingly, this sends us to Github to login and grant permission! When we proceed we end up back at `localhost:3000/auth/github/callback` and we can see a bunch of information in the url parameters. Let's add this route to our `routes.rb` so we can see what the response has to offer:

    get "/auth/:provider/callback" => to: "sessions#create"

I've made the route point to a sessions controller to the create action, you could send it anywhere, but creating a new session for our user makes sense, so we'll call it sessions. Let's create this controller  action

Now build this controller with a `create` action:
```ruby
class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    raise
  end

end
```
We're assigning a variable to `request.env['omniauth.auth']`. This is information stored in the `headers` of the HTTP request. This data is a hash, you can see all of the likely keys this hash will have in the [OmniAuth README](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema), but the key/values returned varies by provider (there's lots of documentation reading in our future). Github will return the following important keys:

```ruby
# the `uid` is an identifier for the user from the provider's system
# using it plus the provider type (github in this case),
# we can uniquely identify a user
auth_hash["uid"]

# the info hash contains specifics of the user's account
auth_hash["info"]["name"]
auth_hash["info"]["email"]
```

We can use the above information returned by Github to create a user.

### Creating Users

```bash
rails g migration OmniAuthUser
```

```ruby
#migration file
def change
  remove_column :users, :password_digest
  add_column :users, :uid, :integer       # for the unique user identifier from the provider
  add_column :users, :provider, :string   # for the provider name
end
```


We want to ensure the user model is ready to go `app/models/user.rb`

```ruby
class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
  end
end
```

### Receiving the request

Now we have the functionality to initialize a user using the hash that will be return from the provider request:
```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path, notice: "Failed to save the user"
      end
    else
      redirect_to root_path, notice: "Failed to authenticate"
    end
  end

end
```

## Test Config

Next we'll add some configuration and specs to test the creation of users with OmniAuth:

```ruby
# /test/test_helper.rb

## The following goes inside the `class ActiveSupport::TestCase` block:
def setup
  # Once you have enabled test mode, all requests
  # to OmniAuth will be short circuited
  # to use the mock authentication hash.
  # A request to /auth/provider will redirect
  # immediately to /auth/provider/callback.

  OmniAuth.config.test_mode = true

  # The mock_auth configuration allows you to
  # set per-provider (or default) authentication
  # hashes to return during testing.

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({:provider => 'github', :uid => '123545', info: {email: "a@b.com", name: "Ada"}})
end
```

## Resources
[Environment variables on Heroku](https://devcenter.heroku.com/articles/config-vars)
