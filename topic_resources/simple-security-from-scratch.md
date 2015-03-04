# Simple Service Security

In this lesson we will learn how to implement a simple security measure into a
web service. We will be using [HMAC](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code)
to "sign" requests and check the signature of the request on the other end.

Using this technique we will accomplish the following:

- Ensure the data has not been tampered with.
- Ensure the sender is who they say they are.
- Ensure the request was sent in the last 10 seconds.

What this will not accomplish:

- Encrypting the actual data.

We are going to build two apps, a user client, and a blog service. From the user
client we want to be able to send posts to the blog service, and have the blog
service only accept the request if:

- Only if the requester knows a secret key.
- If the request is dated within the last 10 seconds
- We are certain no one encountered the request in the middle and changed any
of the data (including the time, path, request method).

## Getting Started

Create two seperate rails apps.

```bash
rails new user-client -T
rails new blog-service -T
```

And prepare simple data models for both apps

```bash
cd blog-service
rails g model post title:string body:text user_id:integer
rake db:migrate

cd ../user-client
rails g model user username:string
rake db:migrate
```
Now we will add create a class that handles the authentication process

```bash
touch lib/service_authentication.rb
```

Add the following to `config/application.rb` to auto require the file we just created
inside the `Application` class.

```rb
config.autoload_paths += Dir["#{config.root}/lib/**/"]
```

And create the basic definition for the class:

```rb
require 'openssl' # This is for creating the signature
require 'base64'  # This is for turning the signature into a prettier string

class ServiceAuthentication
end
```
## The logic


This class should have two methods `#sign` and `#authenticated?`.  The `#sign`
method will return a "signature", the signature is a bunch of the data for the
request run through a cryptographic hash function (which returns a long funny looking string)

```rb
"\x12\xCA\xD2d\xB7\xCA\xBF*x\x88,\bg\xAD\xE8\xB8\xD2>\r,"
```

We then will use `Base64` to encode this down into a better looking string:

```rb
"EsrSZLfKvyp4iCwIZ63ouNI+DSw="
```

The data we want to use to create this signature will be:

- params: Outgoing `params` (`{user_id: 1}`)
- time: Current time in seconds
- path: The path of the request (`/posts`)
- method: The HTTP request method to be sent (`GET`)
- key: A secret key to be shared between both services

To start lets make the class accept all of these values:

```rb
require 'openssl'
require 'base64'

class ServiceAuthentication
  def initialize(key, params, path, method, time)
    @key    = key
    @params = params
    @path   = path
    @method = method
    @time   = time
  end
end
```

Now we have a basic class that accepts a bunch of arguments (it's messy, but we can refactor)
next we should create the method that signs the request.

```rb
def sign
  digest = OpenSSL::Digest::Digest.new('sha1')
  data   = @params.to_query+"&path=#{@path}&method=#{@method}&time=#{@time}"
  hmac   = OpenSSL::HMAC.digest(digest, @key, data)
  Base64.encode64(hmac).chomp
end
```

This will get it done, but let's break down each line

```rb
digest = OpenSSL::Digest::Digest.new('sha1')
```

This line creates a an object which tells, HMAC how to process the data, this
line isn't very important for our purposes ~hand wave~

```rb
data   = @params.to_query+"&path=#{@path}&method=#{@method}&time=#{@time}"
```
This line takes the params, something like `{user_id: 1}` or `{post: {title: "Security is fun"}}`
and calls the `to_query` method, which turns it into a string formatted for a URI
Then we are appending the path, method, and time in the same type of format to
the end of the string. In the end `data` will look something like:

```rb
"user_id=1&path=/posts&method=GET&time=1393821313"
```
Next line:
```rb
hmac   = OpenSSL::HMAC.digest(digest, @key, data)
```

We are taking the `digest`, the `key`, and the `data` string and passing it
into this `HMAC.digest` method, this gives us back the longer string.

```rb
Base64.encode64(hmac).chomp
```

Next we stick that `hmac` value into a [base64](http://en.wikipedia.org/wiki/Base64) encoder,
And out pops our signature!

```rb
ServiceAuthentication.new("key", {foo:'params'}, "/path", "GET", Time.now.to_i).sign
# => "UAIp8H+ri1y+/VB0PSP4NepICn4="
```

A quick refactor to make this class a bit cleaner:

```rb
require 'openssl'
require 'base64'

class ServiceAuthentication
  def initialize(key, params, path, method, time, sig=nil)
    @key    = key
    @params = params
    @path   = path
    @method = method
    @sig    = sig
    @time   = time
  end

  def sign
    Base64.encode64(OpenSSL::HMAC.digest(digest, @key, data)).chomp
  end

  def data
    @params.to_query+"&path=#{@path}&method=#{@method}&time=#{@time}"
  end

  def digest
    OpenSSL::Digest::Digest.new('sha1')
  end
end
```

## Implementing the Client

Create a `Post` class that we will use to talk with the blog service

```bash
touch app/models/post.rb
```

In this model we'll use `HTTParty` and the `ServiceAuthentication` class to make the requests
We will include the data that we used for the signature (as well as the signature)
in the [headers](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
of the request.

Add httparty to the Gemfile

```rb
gem "httparty"
```

And implement the `Post` class

```rb
class Post

  def initialize(user_id)
    @user_id = user_id
  end

  def all
    @params = {user_id: @user_id}
    @path = "/posts"
    @method = "GET"
    HTTParty.get("http://localhost:3001#{@path}",
      query: @params,
      headers: headers
    )
  end

  def headers
    time = Time.now.to_i.to_s
    {
      "REQUEST_TIME" => time,
      "REQUEST_SIGNATURE" => ServiceAuthentication.new("testkey", @params, @path, @method, time).sign
    }
  end
end
```

As you can see I've pulled a headers hash into a separate method, `HTTParty`
allows you to add any headers to a request simply by passing in a `headers` key
in any request.

So with the current implementation I can do the following from the console:

```bash
user = User.last # Assuming you've created one first
Post.new(user.id).all
```

To make a request to our blog service running at `http://localhost:3001`, but it's
not running yet, os let's get it going.

## Authenticating in the Blog Service

The blog service will now receive a `GET` request to `/posts` that includes the
params `{user_id: 1}`, as well as a HTTP header of the time the request was sent,
and the signature from the request. We can now write a function that ensures this
signature is authentic.

I'm going to use the same class for authenticating the user on the other end, I'm
just going to copy the file, but this may be a good time to make a gem.

Switch over the the blog app and do some base setup:

```bash
cd ../blog-service
cp ../user-client/lib/service_authentication.rb lib/
rails g controller posts
```

```rb
# config/application.rb
config.autoload_paths += Dir["#{config.root}/lib/**/"]
```
```rb
#config/routes.rb
get "/posts", to: "posts#index"
post "/posts", to: "posts#create"
```

```rb
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
    render json: @posts
  end

  def create
    @post = Post.new(params.require(:post).permit(:body, :title, :user_id))
    if @post.save
      render json: @post
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
end
```

All of that is pretty simple. Let's start the server at port 3001, then go into
the rails console of our client and try out a request.

```bash
rails s -p 3001
cd ../user-client # In a new terminal
rails console
Post.new(1).all
```

The response is successful, there aren't any users returned because we haven't
actually created any yet. Let's go back to the service and add authentication.
In `app/controllers/application_controller.rb

```rb
    # protect_from_forgery with: :exception COMMENT THIS LINE OUT
    before_action :check_authenticity

  def check_authenticity
    render status: :unauthorized, text: "403 Unauthorized"
  end
```

This will make all requests fail with a status of `403`. Try your client from the
terminal again to confirm.

At this point if we go into the rails console of
the client, we can now use the Post class that we made to make a request to the
service

Now we need to wrap this render unauthorized in a `authenticated?` method.
Let's put this method in the same `ServiceAuthentication` class. We'll also need to
pass in the signature received in the HTTP headers to compare to the signature
that our class generates.

```rb
# Modify the initialize method to accept the signature
def initialize(key, params, path, method, time, signature=nil)
  @key          = key
  @params       = params
  @path         = path
  @method       = method
  @time         = time
  @signature    = signature
end

def authenticated?
  timeout && @signature == sign
end

def timeout
  Time.now.to_i - @time.to_i < 10
end
```

And implement these methods into the application controller:

```rb
def check_authenticity
  time = request.env["HTTP_REQUEST_TIME"] # This is the field we set manually in the client
  path = request.env["PATH_INFO"] # Rails provides this key
  sig  = request.env["HTTP_REQUEST_SIGNATURE"] # This is the signature we created on the client
  method = request.method # This it the HTTP method (ie "GET")
  params.delete(:controller) # Remove the controller and action keys from params
  params.delete(:action)
  unless ServiceAuthentication.new("testkey", params, path, method, time, sig).authenticated?
    render status: :unauthorized, text: "403 Unauthorized"
  end
end
```

When we pass all of the same arguments into the  `ServiceAuthentication` initlialization
we should be able to recreate the same signature the `authenticated?` method will
compare the two, as well as assess if the time provided has been within the last 10
seconds.

Ta-da. This should now protect against any request that doesn't have a signature
that can be recreated in the service. Some benefits of this technique:

- The `testkey` can be changed to reset the security if the apps security is compromised.
- The request is time sensitive.
- If any single character of the request is incorrect (tampered in a "man in the middle" attack) the signature will not match.

## Todo

- Implement the `create` method in the `Post` class.
- One potential bug in our code is that the params may not end up in the correct order, thus the signature would not be the same, make the `ServiceAuthentication` class sort params by keys before signing.
- Write tests.

## Resources
[What is HMAC and why is it useful](http://www.wolfe.id.au/2012/10/20/what-is-hmac-and-why-is-it-useful/)
