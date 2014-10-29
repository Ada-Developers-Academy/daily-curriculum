# Helper Methods

In this lesson we will be be learning about common helper methods as well as defining new helper methods.

#### Common Methods

- javascript_include_tag
- stylesheet_link_tag
- image_tag
- video_tag
- audio_tag
- yield

**javascript_include_tag**

Returns the HTML for a `script` tag with the `src` attribute defined to the current path to the filename given as an argument.

**stylesheet_link_tag**

Returns the HTML for a `link` tag with the `href` attribute defined to the current path to the filename given as an argument.

**image_tag**

Returns the HTML for a `<img>` tag with the `src` attribute defined to the current path to the filename given as an argument.

**link_to**

Returns the HTML for a `<a>` tag with the `href` attribute. Takes at least two arguments, the first being the text to display on the page, the second being the value of the `href` attribute

**render**

`render` in the view is different than render within the controller, within the view `render` renders a partial. Partials are ERB files that start with an underscore. Partials are inteded for DRYness, a peice of HTML that is reused over multiple views. Partials optionally accept options for local variables.

    b = Book.find(1)
    <%= render "some_partial", book: b %>

Would pass the `b` object to the partial as the local variable `book`, so in this case `book` could be used in the partial.

    I'm the partial, with <%= book.name %>!

Notice `book` a local variable not an instance variable.

**yield**

`yield` is used within a layout file (`application.html.erb`) which indicates where the contents of the template are inserted.

#### Defining new helper methods

New helper methods are defined in within the `app/helpers` directory. All of the helper files within `app/helpers` will be available to any page, the only reason to have seperate files is to seperate concerns. The `application_helper.rb` is a great place to define methods that are not specific to a model.

Let's define a new method that transforms a date object into something readable:

    def readable_date(date)
      "<span class='date'>" + date.strftime("%A, %b %d") + "</span>"
    end

Then within any view I could use this method, and pass in any date or time object:

    <h1><%= @book.title %></h1>
    <%= readable_date(@book.created_at) %>

This would produce the HTML

    <h1><%= @book.title %></h1>
    <span class='date'>Wednesday, Jan 08</span>
