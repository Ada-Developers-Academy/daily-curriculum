# Rails Forms

There are two primary ways to generate HTML forms within Rails `form_tag` and `form_for`.
The two methods are very similar, HTML form elements are generated.

## form_tag
`form_tag` generates an HTML `<form>` element. The first option that it takes is the
submission path, (the `action` attribute in the `form` tag). The `method` attribute defaults to `POST`.

```erb
<%= form_tag "/products" do %>

<% end %>
```

This would generate...
```html
<form action="/products" method="post">
  
</form>
```

Additional arguments can be given after the path in the form of a hash. The most common option
would be to change the HTTP method

```erb
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

## form_for
`form_for` is very similar, except it binds the form to an ActiveRecord object.
The only required argument is takes is any ActiveRecord object. Rails will assume
the action to submit to using the RESTful convention (POST to '/products' for creating new records and PUT/PATCH to '/products/:id' for updating existing records, for example).

```erb
<%= form_for @product do |f| %>

<% end %>
```

```html
<form  action="/products" class="new_product" id="new_product" method="post">

</form>
```

The `form_for` block is given an argument (commonly `f` for "form builder"),
this object has methods very similar to the generic form builders like `text_field_tag`, but Rails can make assumptions about the form structure because of what it knows about the object.

```erb
<%= form_for @product do |f| %>
  <%= f.text_field :title %>
<% end %>
```

```html
<form action="/products" class="new_product" id="new_product" method="post">
  <input type='text' name="product[title]" value="<%= @product.title %>" />
</form>
```

1. It automatically prepends the name field with the class of the ActiveRecord object. This way all elements of this form will be grouped together.
1. It automatically fills the `value` attribute of the input with the value of the corresponding attribute of the ActiveRecord object (if it exists).
1. It will differentiate between making forms for __new__ models and forms for editing __existing__ models and update the form's `action` and `method` attributes accordingly


Here's a link to the [official docs for form helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html), which contains a list of the form builder methods for `form_for`.

Likely more helpful is the [Rails Guide for Form Helpers](http://guides.rubyonrails.org/form_helpers.html) which extensively covers both kinds of forms discussed in this document.
