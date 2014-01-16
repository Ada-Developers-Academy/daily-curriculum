# Consuming an API w/Ruby

### HTTP isn't just for browsers

Web api's are requested using HTTP, this means that many tools and any programming language can make requests. Ruby has **many** tools to make HTTP requests:

- [HTTParty](http://httparty.rubyforge.org): Super simple, great to use for learning and simple requests
- [Net::HTTP](http://ruby-doc.org/stdlib-2.1.0/libdoc/net/http/rdoc/Net/HTTP.html): Standard Ruby library.
- [Typheous](https://github.com/typhoeus/typhoeus): Advanced functionaltity such as parallel requests and streaming.

Here is an example of a simple HTTP request using the HTTParty gem.

    require 'httparty'
    r = HTTParty.get("http://amigoingtodie.org")
    
It's that simple. This HTTP request is exactly the same as a request coming from your browser, a form, link, button, etc...  The return value of the HTTParty `.get` method is an HTTParty instance 

    #<HTTParty::Response:0x7fda1db7a238 parsed_response="<html>\n<head>\n  </head>\n  <title> am i going to die?</title>\n<body>...
    
This instance of HTTParty has methods to access the data from the request:

    r.body    # => Raw response of the HTTP body (the html in this case)
    r.code    # => The numerical code of the response (200)
    r.message # => The text message that corresponds to the code ("OK")
    r.headers # => A hash of data about the request (date, server, content-type)
    
So HTTParty is a tool to make HTTP requests, but HTML isn't a great way for computers to consume data, typically JSON or XML are used to represent data when it's not being displayed to humans. Let's look at an example of HTTParty with a JSON response:

    r = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle")
    # => <HTTParty::Response:0x7fda1c9e2778 parsed_response={"coord"=>{"lon"=>-122.33, "lat"=>47.61}...
    # => HTTParty will attempt to automatically parse any data that it knows how, 
    # it's very good at doing this with JSON
    r.parsed_response
    # => {"coord"=>{"lon"=>-122.33, "lat"=>47.61}, "sys"=>{}}
    
As you can see the `.parsed_response` returns a ruby `Hash`. HTTParty took the response JSON, and parsed it into ruby. This works similarly with XML.

#### Parsing  JSON

When `HTTParty` isn't being used, you would need to parse the JSON using Ruby. Ruby provides a class to parse JSON, the class is called `JSON`, the method to parse is called `.parse`. First let's look at what some JSON looks like:

    '{"person": {"name": "Bookis"}}'
    
We can see it suspiciously similar to a ruby Hash, but it's wraped in a String (JSON IS a string). To turn this into a ruby Hash:

    JSON.parse('{"person": {"name": "Bookis"}}')
    # => {"person"=>{"name"=>"Bookis"}}
    
    
#### Dealing with the data

We've looked at what an api is, how to make a request to it using ruby, and the types of responses you can expect back. Let's look at an example of how we could use this [data](resources/weather.rb).

    require 'httparty' # If using Rails with a Gemfile, this require is not needed
    class Weather
      attr_accessor :city
  
      def initialize(city)
        @city = city
      end
  
      #Using HTTParty to get and parse a JSON request
      def current_weather
        HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}").parsed_response
      end
  
      def forecast
        HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city}").parsed_response
      end
    end
    
Pretty much all of the data we deal with ends up being a Ruby hash.


    