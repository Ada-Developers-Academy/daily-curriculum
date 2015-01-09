#Cat Adventure

![Starbuck is adorable](https://github.com/shanghaiellen/cat-adventure/blob/master/starbuck.png)

Oh no! Brave Starbuck is stuck in the living room! There are dogs
everywhere and she needs to escape to the upstairs bedroom, where
there's a warm patch of sunlight she can sleep in safely.

To help her get there, you'll be creating a small text adventure
only in JavaScript. Begin by forking [this repo](https://github.com/shanghaiellen/cat-adventure).
Go to your fork (YOURNAME/cat-adventure) in Github and copy the 
clone URL, which is located in the right nav bar (it might be ssh,
https, or Subversion).

`cd` to the directory ABOVE where you want your cat-adventure directory 
to live (Docs, ada_homework, whatever). In your terminal, type `git clone
<YOUR COPIED CLONE URL>`, replacing <YOUR COPIED CLONE URL> with, you guessed
it, your copied clone url. It should look like `git clone foo`.

This should create a cat-adventure directory for you, with files. `cd` into
your cat-adventure directory. You'll see that it contains two files: an html 
file and a JavaScript file. YOU ARE NOT ALLOWED TO WRITE ANY MORE HTML, except 
for css ids/classes. Let me say that again:

YOU ARE NOT ALLOWED TO WRITE ANY MORE HTML, except for css ids/classes.

Use the JavaScript file to do the following things:

- Create click events on the relevant html elements on the page that
show the user the appropriate information.
- When Starbuck's escape points change, show the right values in the
HTML to accurately reflect these changes.
- Create a Cat model
- Create a Cat model function that changes the number of escape points the cat has
- Create a click event that fires when the user clicks on a "run to" that:
  - Updates the header to show which room Starbuck is in
  - Shows an alert that includes the description of the room Starbuck has moved to
  - Updates the escape points appropriately
  - Displays the correct escape rooms that
    - Updates the "look" span (see: "look at the kitchen") to fire the right description alert when clicked
    - Updates the "run" span to escape to the correct room when clicked

Once you have created a game that can be won and can be lost in a predictable
way, feel free to continue this project or be done with it. It isn't very DRY;
maybe you can refactor this code? Or maybe you want to add more scenarios?

##Goals
- Refresh your memory with JavaScript
- Increase your comfort level when writing JavaScript
- Practice creating the following in JavaScript:
    - Objects
    - Variables
    - Functions
    - Click events
    - For loops

