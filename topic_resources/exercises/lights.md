# Lights Exercise

**Note**: You should try to come up with the solution in two different languages. Compare and contrast the solutions against one another. What built-in language functions have you used? What things were you able to do easily in one language but not as easily in the another?

Borrowed from [Advent of Code](adventofcode.com)

You have set up one million lights in a 1000x1000 grid in an effort to light up your neighborhood.

Furthermore, you have gotten [instructions](../exercises/lights-input.txt) on how to display the ideal lighting configuration.

Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off.

To light up your neighborhood this year, all you have to do is set up your lights by doing the instructions that have been sent to you in order.


### For example
turn on 0,0 through 999,999 would turn on (or leave on) every light.
toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.

### Goal
After following the instructions, how many lights are lit?
