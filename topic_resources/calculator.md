# Calculator Exercise

## Bronze
Build a calculator command line interface (CLI) that allows a user to perform simple arithmetic. The program should ask for an operation (addition, subtraction, multiplication, division) and two numbers, then give the result of applying the operation to the two numbers.

The program should accept both the name (`add`) and the symbol (`+`) for each possible operation.

## Silver
- Print out the formula in addition to the result, i.e. `2 + 2 = 4`
- Add support for computing exponents (`2^4 = 2 * 2 * 2 * 2 = 16`).
- Add support for the modulo operator (`10 % 3 = 1`).

## Gold
Gracefully handle unexpected user input:

- What happens if the user input is `nil` (i.e., the user just pressed enter)?
- What happens if the user tries to add `hotdog` to `elephant`?

## Platinum
- Make your program know when it needs to return an _integer_ versus a _float_.
- Add support for parentheticals, i.e. `10 / (5 + 5) = 1`.

### [Rubric](../rubrics/week_1_calculator.md)
