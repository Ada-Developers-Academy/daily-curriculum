# Random Menu Generator
Create a program that runs from the Terminal that will create a random menu based on several items that you determine.

## Baseline
Come up with the three arrays of ten items each. Each list should be a different type of food or descriptor for that food.

For example, the first array can contain adjectives, the second, cooking styles and the third, foods. If this was the array selection, it could create a few items like:
  - hot pan-fried dumplings
  - soft steamed clams
  - etc.

## Primary Requirements
Create a random menu generator that can be played from the Terminal.

Your generator should pull one item from each array you made in the baseline requirements to create a "menu item".

When the program runs, it should create and show a list of ten numbered menu items.
```ruby
1. hot pan-fried dumplings
2. soft steamed clams
3. ...
...
10. creamy taco cake
```

## Optional Requirements
- Expand your solution to ensure that no descriptive term in a menu item is ever repeated. So if the first menu item is `hot pan-fried dumplings`, the the phrases `hot`, `pan-friend` and `dumpling` cannot individually be used in any other menu items.
- Expand your solution to allow the user to determine how many items they'd like to see via user input.
  __Note:__ You will need to ensure that this user-chosen number of items is not larger than the number of items you have in your arrays.
- Instead of using hardcoded or predefined arrays, make your program accept user input. This user input will be utilized to generate the menu items. You'll need to prompt for and store a varying number of entries for each food-type array.
