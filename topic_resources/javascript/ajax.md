# Ajax

In this lesson we will look at AJAX and the supporting ideas to making an AJAX request.

Ajax (Asynchronous JavaScript and XML), is a method of making HTTP requests from the browser to a server without refreshing the browser page. Ajax is initiated using Javascript, but we will use jQuery to make it a bit more clear for us to use.

### Sample App

Next, lets warm up with just a little jQuery DOM manipulation, that will help us get a feel for what we want the functionality to be. We want to be able to delete clubs without refreshing the page.

#### Setup
- Clone [this repo](https://github.com/Ada-Developers-Academy/jquery-practice)
- Get the app running with:
```bash
bundle
rake db:create db:migrate db:seed
rails server
```
- Navigate to the root page in the browser

#### Getting started

We are going to start on the index page of our app to add some interactivity. We will start with the "Choose" button.

```html
# app/views/clubs/index.html.erb
<%= button_to "Choose", player_club_path(club.id), class: "choose btn btn-success"  %>
```

We've added a class of `.choose` to the button so we can use this class as our jQuery selector.

```js
# app/assets/javascript/clubs.js
jQuery(document).ready(function() {
  $(".choose").click(function(e) {
    e.preventDefault();
  });
});
```

All this jQuery is doing is disabling the link so if we refresh our page and click the link, nothing will happen.

Let's look at the markup to help us determine how we might modify the appearance of this element. Where is the html element with class `club` in relation to the html element with class `choose`?
```html
<div class='club row'>
  <h4 class='col-lg-2'><%= club.name %> <small><%= club.category %></small></h4>
  <p class='col-lg-9'>
    <%= Faker::Lorem.paragraph %>
  </p>
  <div class=' col-lg-1 actions'>
    <%= button_to "Choose", "/", class: "choose btn btn-success"  %>
  </div>
</div>
```

Next lets add some functionality change the element in the DOM:
```js
jQuery(document).ready(function() {
  $(".choose").click(function(e) {
    e.preventDefault();
    var div = $(this).parents(".club");
    div.addClass("chosen");
  });
```

The additional code will find the parent element with class `club` and then add a new class called `chosen` to that parent div element.

Ok, so now we have the functionality on the client side that we want, next lets implement some AJAX to actually update the item in the database.

First we'll create the controller and actions in rails that will add a `Club` to a `Player` through the `PlayerClub` model.

Next we'll implement the js:

```js
$(function () {
  $("input").click(function (e) {
    e.preventDefault();
    var div = $(this).parents(".club");
    var url = $(this).parents("form").attr("action");
    $.ajax(url, {
      type: "POST",
      success: function (data) {
        div.addClass("chosen");
      }
    });
  });
});
```

The `.ajax` method takes two arguments. The first parameter is the url we want to send an HTTP request to. The second is an object of options, or settings as jQuery calls it.

In this example, the first option we are setting is `type`, which specifies the HTTP method (GET, POST, etc...) that should be sent.
The next option is `success`, which takes a `function` as a value. If the HTTP request is successful this function will be executed with the HTTP response as an argument.

Let's look at the jQuery ajax methods a little closer. jQuery provides several methods to help make ajax requests:

- `$.ajax`
- `$.get`
- `$.post`
- `$.getJSON`

Each of these do the same thing (an ajax request), they just set some of the HTTP request attributes differently. The `$.ajax` method is the most broad, this is the method to use for full functionality. But let's take a quick look at the `$.get` method to try to simplify things a bit:
```js
$.get('/clubs.json', function(data, textStatus, xhr) {
  console.log(data);
  console.log(textStatus);
  console.log(xhr);
});
```

This method takes two arguments. The first argument is the url to submit the request to. The second is a function which will receive, the data, status, and the HTTP response itself.

### Note
JavaScript itself provides AJAX functionality without the help of jQuery. We use jQuery for this because it abstracts away some of minutia that makes it more difficult to use JavaScript by itself.

### Resources

[jQuery Ajax docs](http://api.jquery.com/jquery.ajax/)  
[jQuery Railscast](http://railscasts.com/episodes/136-jquery)  
[Rails w/javascript](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html)  
