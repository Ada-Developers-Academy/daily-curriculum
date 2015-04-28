# Getting Started Exercises

Use the js-playground to write the code in these exercises. You will need to create modules in the src/ directory for your solutions to the exercises.

## Reverse an Array

JavaScript provides an Array.reverse method. For practice, we're going to write something similar. Neither solution should use the reverse method.

Create a module in src/ called reverser.js. This file should export a JS object with methods that are the functions defined in the exercises.

### Bronze

Write a function called reverseArray() that takes an array, ```ar``` as an argument and returns a new array that has the same elements as ```ar```, but in inverted order. Add this function to your reverser module.

### Silver

Write a function called reverseArrayInPlace() that takes an array ```ar``` as an argument and returns the same array modified to have its elements in reverse order.

## LinkedList

We can create a simple LinkedList in JS with an object:

```javascript
var ListNode = {
  data: null,
  next: null
};
```
We can inherit behavior from this module by creating objects that use the module as a prototype:
```javascript
// elsewhere in your code...
// create an "instance" of a list node via
// a prototype.

var n = Object.create(ListNode);
```

Create a module called listNode.js that exports a the ListNode object.

### Bronze

Write a method for the ListNode module called ```prepend```, which takes a value and returns a new ListNode that contains the value passed in, and which points to the original ListNode in its next field.

### Silver

Write a method called ```nth``` on the ListNode module which takes an integer n, and returns the nth element of the list if it exists, and ```undefined``` if it does not exist.
