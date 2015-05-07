## Random Menu Generator

Bronze
------
Create a random menu generator that can be played from the Terminal.

Your code should use three arrays, each containing a different type of word, phrase, ingredient, or descriptor you would associate with food. Your generator should pull one item from each array to create a "menu item".

For example, you could have a list of adjectives, cooking styles and foods in order to create something like:
+ hot pan-fried dumplings
+ soft steamed clams

Each array should contain ten items. When the program runs, it should create and show a list of ten different numbered menu items.
```ruby
1. hot pan-fried dumplings
2. soft steamed clams
3. ...
...
10. creamy taco cake
```

Silver
------
Expand your solution to use __any__ number of menu items that you provided. So if you expand your arrays to contain 15 or 20 items, your program will show a list of 15 or 20 items.

Gold
----
Expand your solution to ensure that no descriptive term in a menu item is ever repeated.
Expand your solution to allow the user to determine how many items they'd like to see via user input.

Platinum
--------
Instead of using hardcoded or predefined arrays, make your program accept user input. Then generate menu items from the user provided input. You'll need to prompt for and store a varying number of entries for each array.
