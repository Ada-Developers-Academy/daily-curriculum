# Practicing Interview Problems

Technical interviews can be stressful, but like most anything else, they are a learned, practiced skill. DON'T PANIC! Technical interviews are not necessarily about evaluating the validity of your solution, but often are more about evaluating a candidate's technical communication skills and problem solving approach.

If you approach problems systematically, and communicate clearly, you'll be most of the way there.

## Problem Solving approach

1. **Understand the Probem**
   * Ask your interiewer questions
   * Draw a picture of what you understand
   * Create a specific example

1. **Devise a plan**
   * What is the simplest approach that you can think of?
   * Have you solved any similar problems
   * Outline your approach in plain English
   * Draw a picture of your data structure

1. **Execute the plan**
   * Turn your plain language description into code
   * Write whiteboard code slowly
   * Check each step
   * Ask questions / call out places where you don't know the syntax

1. **Check your answer**
   * Run examples through your whiteboard code
   * Think about the number of steps that your solution takes
   * Can you improve your solution? Red, Green, Refactor!

## Example Problem: Reversing a Linked List

***Problem statement***: Given a linked list ```l```, write a method ```reverse``` that takes ```l``` as input and then returns a linked list ```rev_l``` which has its values in reverse order. You may mutate the list ```l```.

A linked list is defined via the following class:

```
class ListItem
  attr_accessor :value, :next
  def initialize(val, next = nil)
    @value = val
    @next  = next
  end
end
```

Each ListItem has a ```value``` method which returns the value stored in the list item, and a ```next``` method that returns the next ListItem if it exists and ```nil``` if that item does not exist.
