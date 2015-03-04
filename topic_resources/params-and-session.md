# Params & Session

params
-------

Params is a Hash... but not really. Technically it is an instance of `ActionController::Parameters`

**Where does params come from?**

params is an attribute (instance variable `@params`) of the controller. The controller has a getter method defined for `@params`.
When we use the keyword `params` within a controller, it is using the method defined to get the `@params` attribute.

Rails manages this params attribute for us. We never need to change it.

Each time an HTTP request comes in, the application creates a new instance of the class (which is why the params hash is reset for each request).
The HTTP request body or query string is parsed by ruby and turned into a hash.


Like we said ealier, params is not technically a hash, it's an instance of `ActionController::Parameters`. This object is a hash like object.
It can be accessed with the same hash methods.

```ruby
params[:username] # => "Boo"
```
Strong Parameters
-----------------

The reason params is technically a `ActionController::Parameters` object is for security.
A feature called Strong Parameters gives the object some additional functionality
beyond what a standard hash has.

Given the following code within a controller.

```ruby
class UsersController < ApplicationController
  # params = {user: {username: "Boo"}}
  def create
    @user = User.create(params[:user])
  end
end
```

This would give the `.create` method a hash argument of `{username: "Boo"}`. Great.
But what if params looked like this:

```ruby
class UsersController < ApplicationController
  # params = {user: {username: "Boo", admin: true}}
  def create
    @user = User.create(params[:user])
  end
end
```

The user would be given the attribute which specifies administrative previleges.
Remember, params is parsed from a HTTP request, an HTTP request is submitted simply through an HTML form.
A malicious user could easily edit the HTML to include the `user[admin]` element.

This is the problem Strong Parameters solves. When an ActiveRecord model is given `ActionController::Parameters` it will throw an error.
We need to use the additional methods on this special hash to refine it down to a usable hash.

```ruby
class UsersController < ApplicationController
  # params = {user: {username: "Boo", admin: true}}
  def create
    @user = User.create(params.require(:user).permit(:username))
  end
end
```

- `require(key)` - This method ensures that the hash structure has the given key. If the key does not exist an error will be raised. The returned value will be the value of the key given.
- `permit(keys)`  - This method marks a list of attribute as permitted. Only permitted key/values will remain within the hash.
- `permit!` - Permits all kesy within the hash structure.

After permitting keys, params will not longer raise an error when given to an ActiveRecord object.

Session
-------

The session is a hash like object (similar to params), but this object is persisted between requests.
Sessions use a cookie in the browser to identify each unique session. The session is meant to store small amounts of data (4kB)

The most common use is to store the id of a logged in user. The session is also a method on the controller.
From within a controller we can get and set session keys using the familiar hash syntax.

```ruby
class UsersController < ApplicationController

  def create
    @user = User.new
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
```
