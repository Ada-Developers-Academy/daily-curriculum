# Ajax

In this lesson we will look at AJAX and the supporting ideas to making an AJAX request.

Ajax (Asynchronous JavaScript and XML), is a method of making HTTP requests from the browser to a server without refreshing the browser page. Ajax is initiated using Javascript, here is an example:

```js
var xhr = new XMLHttpRequest();
xhr.open('get', '/some-url');

// Track the state changes of the request
xhr.onreadystatechange = function(){
    // Ready state 4 means the request is done
    if(xhr.readyState === 4){
        // 200 is a successful return
        if(xhr.status === 200){
            alert(xhr.responseText); // 'This is the returned text.'
        }else{
            alert('Error: '+xhr.status); // An error occurred during the request
        }
    }
}

// Send the request to send-ajax-data.php
xhr.send(null);
```

But, we are going to be looking more in-depth at requests using jQuery, here is a similar request:

```js
$.get('/some-url', function(data) {
    alert(data);
});
```

### An App

Next, lets warm up with just a little jQuery DOM manipulation, that will help us get a feel for what we want the functionality to be. I want to be able to delete clubs without refreshing the page.

```ruby
# app/views/clubs/index.html.erb
<%= button_to "Choose", player_club_path(club.id), class: "choose btn btn-success"  %>
```

I've added a class of `.choose` to the button to.

```js
# app/assets/javascript/clubs.js
jQuery(document).ready(function() {
  $(".choose").click(function(e) {
    e.preventDefault();
  });
});
```

All this jQuery is doing is disabling the link, if we refresh our page and click the link, nothing will happen. Next lets add some functionality change the element in the DOM:
```js
jQuery(document).ready(function() {
  $(".choose").click(function(e) {
    e.preventDefault();
    var div = $(this).parents(".club");
    div.addClass("chosen")
  });
```

Ok, so now we have the functionality on the client side that we want, next lets implement some AJAX to actually update the item in the database.

First I'll create the controller and actions in rails that will add a `Club` to a `Player`
through the `PlayerClub` model.

Next I'll implement the js:

```js
$(function () {
  $("input").click(function (e) {
    e.preventDefault();
    var div = $(this).parents(".club");
    var url = $(this).parents("form").attr("action");
    $.ajax(url, {
      type: "POST",
      success: function (data) {
        div.addClass("chosen")
      }
    });
  });
});
```

The `.ajax` method takes two arguments. The first parameter is the url we want to send
an HTTP request to. The second is an object of options, or settings as jQuery calls it.

In this example, the first option we are setting is `type`, which specifies the HTTP method (GET, POST, etc...) that should be sent.
The next option is `success`, which takes a `function` as a value. If the HTTP request is successful this function will be executed with the HTTP response as an argument.

Let's look at the jQuery ajax methods a little closer. jQuery provides several methods to help make ajax requests:

- `$.ajax`
- `$.get`
- `$.post`
- `$.getJSON`

Each of these do the same thing (an ajax request), they just set some of the HTTP request attributes differently. The `$.ajax` method is the most broad, this is the method to use for full functionaltiy. But let's take a quick look at the `$.get` method to try to simplify things a bit:
```js
$.get('/clubs.json', function(data, textStatus, xhr) {
  console.log(data)
  console.log(textStatus)
  console.log(xhr)
});
```

This method takes two arguments. The first argument is the url to submit the request to. The second is a function which will receive, the data, status, and the HTTP response itself.

### Resources

[jQuery Ajax docs](http://api.jquery.com/jquery.ajax/)  
[jQuery Railscast](http://railscasts.com/episodes/136-jquery)  
[Rails w/javascript](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html)  
