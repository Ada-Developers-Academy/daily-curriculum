Calculator
==========
Build a calculator command line interface (CLI) that allows a user to perform
simple arithmetic. The program should ask for an operation and two numbers, then
give the result. We'll build this first part as a class, follow along.

Next Steps
----------
1. Instead of printing the result, print out the formula ("2+2=4")
1. Try adding ability to
     + divide
     + multiply
     + find the exponent (such as 2 to the fourth or 2^4 or 2*2*2*2)
     + find the square root of a single number
1. Rather than typing in the name of the mathematical function, could we accept the symbol (+,-,*, etc...)?
1. If the user enters "nil" (just hits enter) instead of a number, what happens? Assuming they meant "0" instead, can our code adjust?
1. What happens if the user enters a String instead of a Number? Can we print an error message if they do that?
1. Quit early if the action is not within our parameters
1. Allow for complex equations (i.e.  1 + (2 * 4))
1. Smarts to return a float or Integer
