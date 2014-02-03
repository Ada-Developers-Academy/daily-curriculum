# Ajax

In this lesson we will look at AJAX and the supporting ideas to making an AJAX request.

Ajax (Asynchronous JavaScript and XML), is a method of making HTTP requests from the browser to a server without refreshing the browser page. Ajax is initiated using Javascript, here is an example:

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
    
But, we are going to be looking more in-depth at requests using jQuery, here is a similar request:

    $.get('/some-url', function(data) {
        alert(data);
    });
    
    
### An App

Lets start by creating an application to use ajax within:

    rails new golf -T
    cd golf
    rails g scaffold clubs name club_type
    rake db:migrate
    touch app/assets/javascripts/clubs.js
    rails s
    
Next, lets warm up with just a little jquery DOM manipulation, that will help us get a feel for what we want the functionality to be. I want to be able to delete clubs without refreshing the page.

    # app/views/clubs/index.html.erb
    <%= link_to 'Destroy', club, method: :delete, class: "destroy", data: { confirm: 'Are you sure?' } %>
    
    # app/assets/javascript/clubs.js
    jQuery(document).ready(function() {
      $(".destroy").click(function() {
        return false
      });
    });
    
All this jQuery is doing is disabling the link, if we refresh our page and click the link, nothing will happen. Next lets add some functionality to remove the element from the DOM:

    jQuery(document).ready(function() {
      $(".destroy").click(function() {
        $(this).parents('tr').remove()
        return false
      });
    });

Ok, so now we have the functionality on the client side that we want, next lets implement some AJAX to actually delete the item from the database:

    jQuery(document).ready(function() {
      $(".destroy").click(function() {
        var club = $(this).parents('tr') // $(this) represents the element that was clicked.
        $.ajax({
          url: $(this).attr("href"), // This gets the attribute 'href' for the clicked element
          type: 'DELETE', // The HTTP method (GET POST PATCH DELETE)
          dataType: 'json',
          success: function(data, textStatus, xhr) { // What to do after the request succesfully completes
            club.remove() // .remove() removes an element from the DOM
          },
          error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem deleting this club.")
          }
        });
        return false
      });
    });
    
  
Let's look at the jQuery ajax methods a little closer. jQuery provides several methods to help make ajax requests:

- `$.ajax`
- `$.get`
- `$.post`
- `$.getJSON`

Each of these do the same thing (an ajax request), they just set some of the HTTP request attributes differently. The `$.ajax` method is the most broad, this is the method to use for full functionaltiy. But let's take a quick look at the `$.get` method to try to simplify things a bit:

    $.get('/clubs.json', function(data, textStatus, xhr) { 
      console.log(data) 
      console.log(textStatus)
      console.log(xhr)
    });
    
This method takes on argument, and then a function to handle the response. The argument is simply the url to submit the request to, then a function that will receive, the data, status, and the HTTP response itself.

### Resources

[jQuery Ajax docs](http://api.jquery.com/jquery.ajax/)
[jQuery Railscast](http://railscasts.com/episodes/136-jquery)
[jQuery & Ajax Railscast (paid)](http://railscasts.com/episodes/136-jquery-ajax-revised)
[Rails w/javascript](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html)