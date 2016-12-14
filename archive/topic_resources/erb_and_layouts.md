# Intro to ERB & Layouts
ERB (Embedded RuBy) is kind of file known as a _template_ that allows us to specify the file contents in any format we want (HTML, CSS, Markdown, etc.) while still _embedding_ Ruby code inside of it, allowing for customization of the content when the template is _rendered_.

## Template Customization
In order to customize an ERB template we make use of special tags, which look similar to HTML tags. All of the tags are "self-closing", meaning there is no corresponding ending tag.

ERB Tags:
- `<%    %>` - Code Tag: When this tag is found in an ERB template, the Ruby code inside of the tag is run.
- `<%=   %>` - Value Tag: When this tag is found in an ERB template, the Ruby code inside of the tag is run and the resulting value is converted to a string and replaces the tag in the final content.
- `<%#   %>` - Comment Tag: This is considered the same as a comment in Ruby and is completely ignored. Nothing will be put into the final content where this tag is located.

The first kind of tag is primarily used for Ruby code that involves a block, such as an if statement of a loop. The second kind is used with any Ruby code that generates a value.

### Examples
We can use value tags to write Ruby code that transforms the text in an HTML document:
```erb
<p>Hello there! <%= "I am shouting this sentence".upcase %>!</p>
```

We can also use value tags to insert values from variables in Ruby:
```erb
<h3>Welcome to your account page, <%= @user.name %>.</h3>
```

Code tags can be used to decide whether or not to include certain portions of content in the final document:
```erb
<html>
  <head></head>
  <body>
  <!-- other code here... -->
    <% if @user.logged_in? %>
      <a href="/user/logout">Log out of your account</a>
    <% else %>
      <a href="/user/login">Log in or sign up</a>
    <% end %>
  <!-- other code here... -->
  </body>
</html>
```

Both code tags and value tags can be combined to create loops with Ruby code that generate multiple copies of content in your documents:
```erb
<html>
  <head></head>
  <body>
  <!-- other code here... -->
    <% @found_products.each do |product| %>
      <p><%= product.name %></p>
    <% end %>
  <!-- other code here... -->
  </body>
</html>
```

## Using ERB Tags with Sinatra
To get the most benefit from the special tags that ERB provides us, we will need a way to provide ERB with variables that can be used inside of those tags. The easiest way to do this is to create instance variables within your Sinatra routes, and then reference those same instance variables inside of your templates.

Example:
```ruby
get "/products/view" do
  @all_products = Product.all
  erb :products_view
end
```
... and inside of `views/products_view.erb` ...
```erb
<html>
  <head></head>
  <body>
    <h1>Our Products</h1>
    <% @all_products.each do |product| %>
      <div id="<%= product.id %>" class="product">
        <h3><%= product.name %></h3>
        <p><%= product.description %></p>
        <a href="/product/<%= product.id %>/purchase">Buy Now</a>
      </div>
    <% end %>
  </body>
</html>
```

By using our route code to create variables with the data that we want to dislay, we can customize our templates in an infinite number of ways and create enormously powerful websites with very little code.

## Layouts
One of the most helpful features of ERB tags is that they allow us to "compose" multiple ERB templates together. This means we are placing the content of a single ERB template at a specific point within a different ERB template. When we have multiple HTML pages that use much of the same content on every page, we can "extract" the repeated content into their own templates.

For example, if we had two HTML pages like this:
```html
<html>
  <head>
    <title>My Website</title>
  </head>
  <body>
    <h1>Welcome to My Website!</h1>
    <p>This is a website that I created. Isn't is awesome?</p>
    <p>Check out my about page <a href="/about_me">here</a>.</p>
  </body>
</html>
```
... and ...
```html
<html>
  <head>
    <title>My Website</title>
  </head>
  <body>
    <h1>About Me</h1>
    <p>I am the person that created this website, that's all you need to know.</p>
  </body>
</html>
```

We could remove the redundant parts by creating a _layout_ template:
```erb
<html>
  <head>
    <title>My Website</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>
```

The `yield` command inside of the value tag in this template tells ERB that it should replace that tag with the content of another ERB template. Here's what the other templates, known as _partials_ would look like:
```erb
<h1>Welcome to My Website!</h1>
<p>This is a website that I created. Isn't is awesome?</p>
<p>Check out my about page <a href="/about_me">here</a>.</p>
```
... and ...
```erb
<h1>About Me</h1>
<p>I am the person that created this website, that's all you need to know.</p>
```

## Using ERB Layouts with Sinatra
As mentioned above, the `yield` command is where the partial template is placed inside of the layout template. However, we need to know which layout template to use, and which partial template to use as well.

With Sinatra we actually specify the partial template when we use the `erb` command in our routes. Sinatra automatically looks for a layout template in its default location: `views/layout.erb`. If that file exists, Sinatra will render that template and then place the content of the partial specified to `erb` in the place where the `yield` command exists in the layout.

Example:
```ruby
get "/about_me" do
  erb :about_me
end
```

This will render the `views/layout.erb` file (the first of the three templates specified in the previous section), and then place the contents of `views/about_me.erb` where the `<%= yield %>` value tag is.
