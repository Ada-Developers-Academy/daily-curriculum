# Session

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
