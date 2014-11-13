# List App

Bronze
------
- Form to create a new to do item.
- Add new to do items to a list when you click the button.
- Use `<li>` class "done" to keep track of if an item is done or not. (Hint: use toggleClass to toggle done items).
- Select items using the "done" class and the "check" class.
- Add new items by creating new HTML for each piece and putting it together using the jQuery append() method.
- Add a button to each task to remove the task from the list

Silver
-------
- When adding new items use an animated toggle (fadeIn, slideDown)
- If you mark all the items in a list "done", ask the user if they want to remove all the items in the list.
- Use the length of the results to determine if all items are done.
- Clear the text field after submitting a task

Gold
------
- Receive 0 errors with the [W3C validator](http://validator.w3.org/#validate_by_input)
- Allow the tasks to be reordered by dragging and dropping using [jQuery UI Sortable](http://jqueryui.com/sortable/)
- Create a "show" page for each todo (hide the full list and show the todo clicked on in larger text)
- Use the [Aria-live](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Live_Regions) attribute make a screen reader announce when a task is successfully added or deleted. See this [example](http://test.cita.illinois.edu/aria/live/live3.php).

Platinum
--------
- Create a rails or sinatra app that can represent the todo data.
- Use the jQuery `$.ajax` method to submit the tasks to the server.
