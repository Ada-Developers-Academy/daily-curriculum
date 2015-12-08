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
