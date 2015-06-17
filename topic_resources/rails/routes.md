## Routes

In this section we will learn about the basics to Rails routing, including:

1. The HTTP request
2. `routes.rb` syntax
3. Relation to Controllers

### HTTP Request

HTTP is the language of the internet. Browsers send HTTP requests to our servers. A sample HTTP request could look as simple as:

    GET /users HTTP/1.1
    Host: adadevelopersacademy.org
    User-Agent: Web-sniffer/1.0.46 (+http://web-sniffer.net/)
    Referer: http://web-sniffer.net/

The two most important parts of this request are:

- `GET`, which is the request method. As we have seen, the most common request methods are `get`, `post`, `put`, `patch`, and `delete`.
- `/users`, which is the path.

#### Anatomy of `routes.rb`

Routes are analogous to an old-timey telephone switch board. When an HTTP request comes into our application our defined routes connect the request data to the correct Controller action. We define routes in our `config/routes.rb` file. The `routes.rb` file is generated when we run the `rails new` command.

    Some::Application.routes.draw do
      get "/users" => "users#index"
    end

Lets go over the pieces of this code:
  - `Some::Application.routes.draw do`: Your Rails app will come pre-populated with this portion already in the file.
  - The **route definition**:
    - **request method**: `get` in this example
    - **path**: what will be matched with the URL in the HTTP request, `"/users"` in this example
    - `=>`: think of this as the router, this points the request path to the controller and action where this request will go.
    - **controller and action**: defining the controller and action, split by the `#`. `"users#index"` in this case this would point to the `index` action in the `UsersController`.

![Rails Request Cycle](../rails/rails-request-cycle.jpg)
