## Submitting Forms

We are going to look at how inputs from a form are passed along through the browser to our server. We'll start by adding a basic form anywhere on our `index.erb` page:

    <form action="" method="get" accept-charset="utf-8">
      <label for="fname">Name</label>
      <input type="text" name="first_name" value="" id="fname">
      <input type="text" name="last_name" value="" id="lname">


      <p><input type="submit" value="Submit"></p>
    </form>
    
In the `form` tag the `action` attribute defines what url (or path) this form will submit to. In this case we're using a blank value because we just want to submit to the same url as the current page.

Next we have a `label` tag

    <label for="fname">Name</label>
    
Labels are the text portion of a form. The reason we use labels instead of plain text is because we can join an `input` and a `label` to when the text is clicked the cursor will focus on the input. The `for` attribute defines the `id` that the `label` will match.

Next we have two `input` tags with the type of 'text' (see [here](http://www.htmldog.com/reference/htmltags/input/) for a complete list of input types). 

    <input type="text" name="first_name" value="" id="fname">
    <input type="text" name="last_name" value="" id="lname">
    
Each `input` tag will pass a value along to the server when we submit the form. The `name` attribute defines the key to the value we input. In this case `first_name` will be assigned to what we type into the first text field.

And finally we have an `input` with the type of submit. This input simply is a button to click to send an HTTP request with the forms data to the url in the `action` attribute of the `form` tag.

Give it a try.

Basically nothing changes except the way the url in the browser navigation bar looks. And with plain ol' HTML there isn't really anything further we could do. 

#### Sinatra w/HTML Forms
    
Since we are using Sinatra, our server can receive the HTTP request and we can use ruby to do what we want with the data. We call the group of key/values sent along with an HTTP request the parameters. Sinatra assigns all of the parameters to a variable called `params` as a ruby `Hash` 

**Note:** `params` is actually an instance variable `@params`, that the `Sinatra::Base` class uses with `attr_accessor`, so `params` is technically a method.

Let's use the power of `erb` to output whatever is assigned to the `params` hash to our `index.erb` page:

    <div id='debug'>
      <hr>
      <h4>DEBUG</h4>
      The params hash: <%= params %><br>
    </div>
    
I've added a little debug section to the bottom of the page. The only important part is the `<%= params %>`. The `<%=` and `%>` are the beginning and end of embedded ruby code. So `<%= params %>` will execute the `params` method, returning the `Hash` containing any values we submit to our server in the HTTP request.

Let's make our form a little bit smarter. We can submit nested data by changing the `name` attribute.


    <form action="" method="get" accept-charset="utf-8">
      <label for="fname">Name</label>
      <input type="text" name="person[first_name]" value="" id="fname">
      <input type="text" name="person[last_name]" value="" id="lname">


      <p><input type="submit" value="Submit"></p>
    </form>
    
Now our `params` `Hash` has become a nested hash.

    {"person"=>{"first_name"=>"Bookis", "last_name"=>"Smuin"}}
    
In Sinatra and Rails this is the way we model Objects. Imagine a `Person` class where the initialize method is coded to assign attributes from a hash. We would simply need to pass the inner hash to the `new` method and all of our attributes would be assigned.

    Person.new(params["person"])
    
Try to add a small message to the top of your page after someone submits a value using the form. Something like:

    Thanks for signing up for our newsletter FIRSTNAME LASTNAME!
    
#### Making a form with Rails `form_tag`

    <%= form_tag "/users" do %>
      <%= label_tag :fname, "First name" %>
      <%= text_field_tag :first_name, params[:first_name] %>
      <%= check_box_tag :bread, 1, params[:bread] %>
      <br>
      <%= label_tag :last_name %>
      <%= text_field_tag :last_name, params[:last_name] %>
      <br>
      <%= submit_tag "Search" %>
    <% end %>
    
`form_tag` takes an argument, which is the path we want our form to submit to. This argument generates the `action` attribute within our `form` tag.

`label_tag` creates an HTML `label` element. The first argument will set the `for` attribute as well as the text within the `label` element. We can optionally give a second argument which will overwrite the text.

`text_field` tag generates an HTML `input` tag with the `type` of `text`, the first agrument we pass in will determine the `name` attribute of the `input` tag.

`submit_tag` generates an HTML `input` tag with the `type` of `submit`
    
