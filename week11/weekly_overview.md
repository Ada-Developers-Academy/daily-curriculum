# Week 11

Week 11 will be a break from Rails to focus on JavaScript and jQuery. We'll focus first on learning core JavaScript language concepts, and then how to use JavaScript and jQuery to program web pages in the browser. Students will create a simple to do list app to add to do list items dynamically to a web page. By the end of the week, students will be able to use JavaScript and jQuery to interact with and modify web pages, and use JavaScript variables, types, arrays, functions, objects, and jQuery methods.

## Goals

- Understanding of core JavaScript concepts and features:
    - variables
    - types
    - arrays
    - functions
    - scope
    - objects
- Understanding of the DOM and how the browser loads and represents web pages.
- Using JavaScript and jQuery to modify a web page:
    - with the JavaScript document object and associated methods
    - with jQuery's $ function and associated methods
- Understanding event handlers to write code that responds to user interaction.


## Schedule
### Monday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**  | Warmup     |
| **9:30 - 12:30**   | Lecture: JavaScript fundamentals. [JS notes & Files](resources/js) |
| **12:30 - 1:30**   | Demo: Using the JavaScript console |
| **1:30 - 5:00**  | Project: Console to do [list maker](resources/js/todo_html.html) [Biggest #](resources/js/project1_day1.md) [Objects](resources/js/project2_day1.md)|

### Tuesday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**   | Warm Up             |
| **9:30 - 11:30**   | Lecture: Working with the DOM [resources](tuesday/) |
| **11:30 - 12:30**  | Mini-project: handling events  |
| **12:30 - 1:30**  | Example: Adding new elements to the DOM |
| **1:30 - 5:00**  | Project: To do list maker |


### Wednesday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**  | Warmup |
| **9:30 - 10:00**  | How *this* works with event handlers |
| **10:00 - 12:30**  | jQuery fundamentals, looking at jQuery documentation |
| **12:30 - 5:00**  | Project: rewrite the to do list maker using jQuery |

### Thursday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**  | Warmup |
| **9:30 - 12:00**  | Devon Persing |
| **1:00 - 5:00**  | Project |

### Friday

| Time              | Topic               |
|:-----------------:|:--------------------|
| **9:00 - 9:30**  | Warmup |
| **9:30 - 4:00**  | Project Time |
| **4:00 - 5:00**  | Retro |

**Weekend Homework**

Look at the jQuery ajax (http://api.jquery.com/jquery.ajax/) API and
think about how you might send a list of to do items to store on
the server with Rails. In this week's projects, the to do items
are not saved; they go away each time you reload the page. By sending
the items to the server you can save them for use in a subsequent session.

OR

Take a look at JavaScript's JSON object (https://developer.mozilla.org/en-US/docs/Glossary/JSON),
and the Local Storage API (https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage).
Add code to your to do list manager to save items in localStorage.
