# User Authentication

In order to accomplish authentication in our application, there are some standard actions that we want to implement.

1. User Creation
1. User Login
1. User Logout

## User Creation
Creating a new User is very similar to creating any new entity in a Rails app.

1. Generate a controller to handle creating a new User  
` rails generate controller Users`

1. Configure routes to point to these new controller actions  
`resources :users, :only => [new, create]`

1. Create the controller actions that corresponds to the routes we configured  
```ruby
  class UsersController < ApplicationController
    def new
    end

    def create
    end
  end
```

1. Create the view form that will handle the user Creation  
```ruby
<%= form_for @user do |f| %>
<% end %>
```

1. Link the user creation form from a button or link on your site

## User Login
Getting the user login functionality to work is a bit different than the traditional entity creation that we're used to.

In combination with the concept of `sessions`, we will utilize a `SessionsController` to manage user login and logout functionality.

1. Generate the sessions controller  
`rails generate controller sessions`

1. Create the controller actions that will enable you to set up a form  
```ruby
  class SessionsController < ApplicationController
    def new
    end

    def create
    end
  end
```

1. Configure the corresponding routes  
`resources :sessions, :only => [new, create]`

1. Create the view form that will handle the user login
```ruby
<%= form_for @user do |f| %>
<% end %>
```

1. Link the login form from a button or link on your site

## User Logout

1. Update the sessions controller to add a `destroy` action that will handle the log out functionality  
```ruby
  class SessionsController < ApplicationController
    ...

    def destroy
    end  
  end
```

1. Update the routes to allow for this new controller action  
`resources :sessions, :only => [new, create, destroy]`

1. Add a logout button somewhere on the site that will trigger the logout route and functionality
