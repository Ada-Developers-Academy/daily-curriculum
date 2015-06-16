## Rails Views 101

Common Helper Methods
-------

Rails gives many methods to help generate HTML, these methods are called
helper methods, view helpers, or just helpers. Some common methods are:

link_to(text, path)
-------------------

`link_to` creates an HTML `<a>` element. The first argument given to the method
will become the text between the `<a></a>` tags, the second argument will become
the value assigned to the "href" attribute of the tag.
```
<%= link_to "About Me", "/profile" %>
```
The above `link_to` will give you this HTML:
```
<a href="/profile">About Me</a>
```

An additional options hash argument is optional to set arbitrary attributes of the `<a>` tag

```
<%= link_to "About Me", "/profile", class: "link" %>
```
The above `link_to` will give you this HTML:
```
<a href="/profile" class="link">About Me</a>
```


button_to(text, path)
---------------------

`button_to` is used to generate a form with where the only input is a submit button.
This is generally used to submit HTTP request with a method type different from GET.

```
<%= button_to "Remove That", "/products/1" %>
```
The above `button_to` will give you this HTML:
```
<form method="POST" action="/products/1" >
  <div><input value="Remove That" type="submit" /></div>
</form>
```

`button_to` will default to an http method of POST, but that can be changed by passing an
optional argument of method.

```
<%= button_to "Remove That", "/products/1", method: :delete %>
```
The above `button_to` using the optional parameter will give you this HTML:
```
<form method="DELETE" action="/products/1" >
  <div><input value="Remove That" type="submit" /></div>
</form>
```


image_tag
---------

`image_tag` generates an HTML `<img>` tag. The argument given will be an image filename for the `src` attribute.
Rails (the asset pipeline) will do magic to look within the `app/assets/images` directory.

```
<%= image_tag "cat.jpg" %>
```
The above `image_tag` will give you this HTML:
```
<img src="/assets/cat.jpg" alt="cat.jpg" />
```

Defining Helper Methods
----------------

All of the above methods are helper methods that Rails defines for us. But what
if we want to make our own method to help us generate the same HTML many times?

The `app/helpers` directory is just for that. When using controller generators
a helper file is generated for that controller, but the names for helpers can be
totally arbitrary. They should just describe the methods within.

For example, I might want to create a method that generates some complex HTML to help me
display dollar amounts. I want to take an integer in cents and convert it into dollars,
at the same time I want to wrap the different parts of the dollar amount into
HTML `<span>` elements to add style.

```html
<span class='dollar-symbol'>$</span>
<span class="dollar-amount">30</span>
<span class='dollar-decimal'>.35</span>
```

<span style='color: #89ab2b; font-weight: bold;'>$</span><span style="font-weight: bold;">30</span><span style='font-size: 70%; color: gray;'>.35</span>

This is quite a bit of HTML to write each time I want to display a dollar amount.
Here it would be appropriate to write a helper method for this.

First, create a helper file:

```bash
touch app/views/helpers/money_helper.rb
```

In that blank file you will add a **module** and define methods within.

```ruby
module MoneyHelper

  def format_money
    dollar  = cents.to_f / 100
    decimal = sprintf("%g", dollar.modulo(1)).split(".").last
    html = "<span class='dollar-symbol'>$</span>" +
    "<span class='dollar-amount'>#{dollar.floor}</span>" +
    "<span class='dollar-decimal'>.#{decimal}</span>"
    html.html_safe
  end

end
```
Partial
---------

Partials are used to DRY your HTML code. It's a way to render an html file within another.

A common use for this could be for a form, error messages, or even the HTML that represents an object that is repeated on multiple pages

A partial is a special file in rails, that lives in the `app/views` directory, but the filename begins with an underscore.

```bash
touch app/views/posts/_error_messages.html.erb
```

We can put HTML into the partial file

```html
<% if @post.errors.any? %>
  <ul class='error-messages'>
    <% @post.errors.each do |column_name, message| %>
      <li>
        <strong><%= column_name.capitalize %></strong> <%= message %>
      </li>
    <% end %>
  </ul>
<% end %>
```

Then implement the partial in the original position of the error message HTML (in that view that it originated)

```html
<%= render "error_messages" %>
```

The `render` takes a string argument, and the string is the filename of the partial (without the leading underscore)
