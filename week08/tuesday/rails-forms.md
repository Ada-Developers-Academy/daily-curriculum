# Rails Forms

There are two primary ways to generate HTML forms within Rails `form_tag` and `form_for`.
The two methods are very similar, HTML form elements are generated.

form_tag
--------

`form_tag` generates an HTML `<form>` elements, the first option that it takes in the
path to submit to, or what will be assigned to the `action` attribute. The `method`
attribute defaults to POST.

```
<%= form_tag "/products" do %>

<% end %>
```
```html
<form action="/posts" method="post"></form>
```

Additional arguments can be given after the path in the form of a hash. The most common option
would be to change the HTTP method

```
<%= form_tag "/products", method: :put do %>

<% end %>
```
```html
<form action="/posts" method="post">
  <input name="_method" type="hidden" value="put" />
</form>
```

Within the `form_tag` block additional form helpers can be used to create inputs and labels.

`text_field_tag` is the the method to make a common text field. The first argument
it expects is the HTML name attribute.
```
<%= form_tag "/products" do %>
  <%= text_field_tag :title
<% end %>
```
```html
<form action="/posts" method="post">
  <input type='text' name="title" />
</form>
```

More complex name attributes can be given

```html
<%= text_field_tag "product[title]" %>
<!-- <input type='text' name="product[title]" /> -->
```

Many other form builders are available to help build any type of form. Look at the
[docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html) for a list of available helpers

form_for
--------

`form_for` is very similar, except it binds the form to an ActiveRecord object.
The only required argument is takes is any ActiveRecord object. Rails will assume
the action to submit to using the RESTful convention ('/products' for new records or '/products/:id' for existing records)

```
<%= form_for @product do |f| %>

<% end %>
```
```html
<form  action="/posts" class="new_post" id="new_post" method="post">

</form>
```

The `form_for` block is given an argument (commonly `f` for "form builder"),
this object has methods very similar to the form builders like `text_field_tag`.
But in this case it will assume a couple of things based on the ActiveRecord object

```
<%= form_for @product do |f| %>
  <%= f.text_field :title %>
<% end %>
```
```html
<form  action="/posts" class="new_post" id="new_post" method="post">
  <input type='text' name="product[title]" value="<%= @product.title %>" />
</form>
```

1. It automatically prepends the name field with the class of the ActiveRecord object. This way all elements of this form will be grouped together.
2. It automatically fills the `value` attribute with the attribute of the ActiveRecord object.


Look at the [docs][http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html]
to see a list of the form builder methods for `form_for`
