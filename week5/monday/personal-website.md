## Quick Walkthrough of Personal Website

Add required html elements

    <!DOCTYPE html>
    <html>
      <head>
        <link  href="css/main.css" media="all" rel="stylesheet">
        <title>Bookis Smuin</title>
      </head>
      <body>
        <!-- Put your HTML here -->
      </body>
    </html>
    
The `<!DOCTYPE html>` should start every HTML page. This tells the browser which version of HTML we are writing. Browsers aren't too strict on this and we will always be using HTML5 we'll always use `<!DOCTYPE html>`

The `html` element is the outer most nest, we write all html within this element.

The `head` element is where we define information about/for the page, rather than writing the page itself.

The `title` tag sets the title on the browser header bar and browser tab text.

The `link` tag is used to link (think import) CSS pages. The CSS page is identified using the `href` attribute.

The `body` element is where we actually write the HTML that builds the visual portion of our page.


The `<!--  -->` is an HTML comment, similar to ruby's `#`, except HTML has an opening and closing statment. The comment goes between the `--`'s

-------

Next we'll create the css file. It's a good idea to put all of the css into a seperate file

    mkdir css
    touch css/main.css
    
CSS doesn't need any meta data. So the file can just sit until we're ready to write some CSS.

We can look at our web inspector console (right-click page and click "Inspect Element", then click "Console") to ensure that the file is properly being loaded. If the CSS isn't properly linked we should see an error that looks something like:

    Failed to load resource: The requested URL was not found on this server. (main.css, line 0)
    
This error will be different in every browser.

#### Implementing HTML
We'll start by making a mock up using apps such as

- [Balsamiq](http://balsamiq.com)
- [Skitch](http://evernote.com/skitch/)
- [InDesign](http://www.adobe.com/products/indesign.html)

I've started using Balsamiq:

![Mockup](mockup.png)

This mockup has:

- Header
- Logo image
- Nav
- Dropdown menu
- Footer
- Form

Lets start