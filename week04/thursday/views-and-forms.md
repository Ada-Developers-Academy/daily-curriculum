# Views & Forms

Views
-----

By "views" I mean the `.erb` html templates that are renedered by
the `erb` command in Sinatra. We are going to look at some common
ruby usage within `.erb` views.

Ruby can be evaluated with `erb` tags. There are actually several
different tags that can be used for different purposes.

- `<%= %>` - (with an equal sign) A single ruby expression. Injects the result into the HTML page
- `<%  %>` - (without an equal sign) Allows for blocked ruby code, such as loops and conditionals. This tag won't inject anything into the HTML directly
- <%#  %>  - (with an octothorpe) A ruby comment. Nothing will be injected in the HTML

Let's look at an example `.erb` view and the resulting HTML, Given:
```ruby
@name = "Bookis"
@family = ["Elise", "Isaac"]
```

```html
<h1><%= @name %></h1>
<ul>
  <% @family.each do |person| %>
    <li><%= person %></li>
  <% end %>
</ul>
```

Which would result in:

```html
<h1>Bookis</h1>
<ul>
  <li>Elise</li>
  <li>Isaac</li>
</ul>
```

Notice that the `.each` loop has `%>` right after the `do ||`. And several lines later there is an `end` statement inside of new erb tags.

Assets
------

If we want to load extra resources such as images, stylesheets, or javascript Sinatra requires that we put them in a dir called `public`. This is a very common pattern for all websites and web servers.

```bash
mkdir public
touch layout.css
touch app.js
```
Each type of resource has a different method for including it in our html.

```html
<head>
  <link href="layout.css" rel="stylesheet">
  <script src="/app.js"></script>
</head>
<body>
  <img src='cat.jpg' alt='A Cute Cat'>
</body>
```

Forms
-----

Forms are the method to collect user input. We won't dive too much into the HTML syntax of a form, but we are going to look at a simple method of submitting info.
html forms use the html `<form>` tag. Inside of the `<form>` tag the `input` tag is the most common way of creating a form field.

```html
<form action='/'>
  <input type='text' name='first_name' />
  <input type='text' name='last_name' />

  <input type='submit'>
</form>
```

Inside the `<form>` and `<input>` tags are three attributes we need to highlight.

**input**

- `type` - The kind of input that should be rendered. Some potential values are:
    - `text`
    - `password`
    - `checkbox`
    - `radio`
    - `submit`
- `name` - The name is the key to the value the user types. When someone gives their first_name in a field.

**form**

- `action` - The path for the form to submit too. Similar to `<a>` `href` attribute.
