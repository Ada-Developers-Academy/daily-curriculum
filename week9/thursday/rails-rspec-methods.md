# Rspec Methods w/Rails

In this lesson we will learn about and live code the most common rpsec methods and practices within models and controllers.

#### Expectations

**expect**

`#expect` requires one argument, which is the value that you want to test, called the actual value.

    expect(1).to eq 1
    
**to**

`to` takes one required argument. `to` true or false, dependin on whether the argument given is a positive or negative match with the value given in `expect`

**to_not**

Does the inverse of `to`.


#### Matchers

Matchers take an argument, called the expected value, to compare against the actual value. Each matcher uses a different comparison method from ruby.

Most matchers are quite clear how they work, here are a list of common matchers:

- `eq`, uses the `==` comparison
- `be_false`
- `be_true`
- `be_nil`
- `be_empty`, uses the `empty?` method
- `be_an_instance_of`, the argument takes a class name, and compares the class of the actual value
- `be_withing`, the argument is a range
- `inclulde`

For more matchers and their documentation see [http://rubydoc.info/gems/rspec-expectations/frames](http://rubydoc.info/gems/rspec-expectations/frames)

#### Requests

In rspec we can use the methods `#get`, `#patch`, `#post`, `#delete` to mimic HTTP requests to our server. These methods take the same arguments, the first being the name of the controller action to make the request to (the controller is assumed by the rspec filename), the second argument is any params. For instance to `get` the show action from a controller, with the id of 10:

    get :show, id: 10
    
**response**

Running this line of code does the HTTP request, but we don't need to assign it's return value to a variable, rspec automatically assigns the last request made to a method called `response`. This `response` mimics an HTTP response, typically this is the actual value we want to compare a value against.

    get :index
    expect(response.status).to eq(200)

The response object has a few helpful methods available to use:

- `body`, returns the raw response of the HTTP body
- `status`, returns the HTTP status, such as "OK"
- `code`, returns the HTTP status code, such as 200

**assigns**

The `assigns` method is another magic part of rspec-rails, this method allows us to access instance variables within the HTTP request (instance variables aren't going to be available directly). `assigns(:book)`, would return the value of `@book` from the HTTP request.

#### Controller Matchers

rspec-rails gives us many handy matchers to evaluate the response.

- `render_template(optional_template_name)`
- `redirect_to(expected_redirect_route)`
- `be_successful`