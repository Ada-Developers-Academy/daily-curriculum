## Rails Controllers

Rails controllers are the brains of application. After a request is routed to our controller action, out controller is responsible for processing incoming data from the request then collecting all of the data to send in the response. This is most commonly saving and retrieving data from a Model.

### In this lesson we will learn about:

- `params`
- Instance variables
- `redirect_to` vs. `render`
- Response formats (HTML JSON)
- ApplicationController
- Controller Filters (`before_action`)

#### params

`params` is a method available within all of our controllers. The key/value pairs assigned to the `params` hash happen in three ways:

- Query String. The query string is everything after `?` in the URL `?name=bookis` would add {name: "bookis"} to the params hash.
- HTTP POST data (Form submissions)
- Named parameters. Named parameters are first defined in the `routes.rb` in the route with a `:` before the name of the desired parameter. The named parameter will be added as a key to the params, the text in the url will be the value to the key. For a route of `/users/:id`, then a request to the url `/users/1`, the params hash would become `{id: 1}`.

[params guide](http://guides.rubyonrails.org/action_controller_overview.html#parameters)

#### Instance Variables

Typically any variable we set in a controller action will be instance variables, this is because we typically want the variable to be available to our views. For instance if we want a `User` object to be available to our view:

    @user = User.find(params[:id])

#### redirect_to vs. render

The last thing our controller action does is send an HTTP response. By default the controller action renders a layout with the same name as the action.

    class UsersController < ApplicationController
      def index
    
      end
    end
    
The `index` action will render the `app/views/users/index.html.erb`, in this path `users` corresponds to the controller, and `index` corresponds to the action. But we can override this default behavior with the `render` method:

    class UsersController < ApplicationController
      def index
        render :home
      end
    end

Would render `app/views/users/home.html.erb`. In many cases we wouldn't want to render a view from an action, such as an action that is meant to create, update, or delete a record in the database. In this case we could redirect to a different controller action.

    class UsersController < ApplicationController
      def create
        @user = User.create(params[:user])
        redirect_to user_path(@user)
      end
    end
    
The `redirect_to` creates a new HTTP request to the path you pass in as an argument. This method can take a couple type of arguments:

- A string of the URL path `/users/#{@user.id} #=> /users/1`
- A named route `user_path(@user)`
- An ActiveRecord object `@user`

All of these three methods will redirect to the same place `/users/1` (given that is the `id` of the created user object)
    
[render guide](http://guides.rubyonrails.org/layouts_and_rendering.html#using-render)
[redirect_to guide](http://guides.rubyonrails.org/layouts_and_rendering.html#using-redirect-to)

#### Response Formats

Say we wanted to build an iPhone app for our Ada Cooks app, we would want to use the same database, but we wouldn't want to use the HTML that our normal website has. For this, we could have additional response formats, such as JSON, that a user could request. When someone visits `/users/1`, instead of HTML, we could serve JSON:

    user: {
      username: "Bookis",
      email: "bookis@adadevelopersacademy.org"
    }
    
In the controller we can use the `render` method with different arguments to accomplish this:

    def show
      @user = User.find(params[:id])
      render json: @user.as_json
    end
    
We can make a single action render either HTML or JSON depending on the HTTP request format.

    def show
      @user = User.find(params[:id])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @user.as_json }
      end
    end
    

[formats guide](http://guides.rubyonrails.org/action_controller_overview.html#rendering-xml-and-json-data)

#### ApplicationController

Controllers inherit from `ApplicationController`, this file can be found in the `app/controllers/` dir. You can add additional functionality to your `ApplicationController` to share methods across all controllers. This is very common with things like determining if the user is logged in before displaying content, or finding the current user from the database.

    class ApplicationController < ActionController::Base
      ...
      
      def require_login
        unless session[:user_id].present?
          redirect_to sign_in_path, notice: "Please sign in"
        else
          true
        end
      end
      
    end
    
The `signed_in?` method would now be available to all of our controllers, in our `OrdersController` we could do something like:

    class OrdersController < ApplicationController
      
      def index
        if require_login
          @order = Order.where(...)
        end
      end
    end
    
#### Controller Filters

Filters are methods that are run before, after or "around" a controller action. We'll focus on the before action here as it is the most common. Before filters can be used for many things, but they commonly help with the same methods we implement in the `ApplicationController`, from the example above we could alternately do:

    class OrdersController < ApplicationController
      before_action :require_login
      
      def index
        @order = Order.where(...)
      end
    end
    
Now the `require_login` method defined in the `ApplicationController` will run before every method within the `OrdersController`.

[Filters guide](http://guides.rubyonrails.org/action_controller_overview.html#filters)


![Rails Request Cycle](../resources/rails-request-cycle.pdf)