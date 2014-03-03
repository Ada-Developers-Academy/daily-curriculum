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

We are going to build two app, a user client, and a blog service. From the user
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

class Authentication
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

class Authentication
  def initialize(key, params, path, method, time, sig=nil)
    @key    = key
    @params = params
    @path   = path
    @method = method
    @time   = time
    @sig    = sig
  end
end
```

Now we have a basic class that accepts a bunch of arguments (it's messy, but we can refactor)
next we should create the method that signs

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

A quick refactor to make this class a bit cleaner:

```rb
require 'openssl'
require 'base64'

class Authentication
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

## Implementing the Service

Create a `Post` class that we will use to talk with the blog service

```bash
touch app/models/post.rb
```

In this model we'll use `HTTParty` and the `Authentication` class to make the requests
We will include the data that we used for the signature (as well as the signature)
in the [headers](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
of the request.

```rb
class Post
  
  def initialize(user_id)
    @user_id = user_id
  end
  
  def all
    @params = {user_id: @user_id}
    @path = "/posts"a
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
      "REQUEST_SIGNATURE" => Authentication.new("testkey", @params, @path, @method, time).sign
    }
  end
end
```

As you can see I've pulled a headers hash into a seperate method, `HTTParty`
allows you to add any headers to a request simply by passing in a `headers` key
in any request.

So with the current implementation I can do the following from the console:

```bash
user = User.last # Assuming you've created one first
Post.new(user.id).all
```

To make a request to our blog service running at `http://localhost:3001`.

## Authenticating in the Blog Service

The blog service will now receive a `GET` request to `/posts` that includes the 
params `{user_id: 1}`, as well as a HTTP header of the time the request was sent,
and the signature from the request. We can now write a function that ensures this
signature is authentic.

## Resources
[What is HMAC and why is it useful](http://www.wolfe.id.au/2012/10/20/what-is-hmac-and-why-is-it-useful/)

    
    




