# More on Complexity

## Big O Notation

We commonly use "Big O" notation when we're talking about the
complexity of our algorithms in terms of both time complexity and
space complexity.

Big O is a simplification of the real complexity. We can figure it out
as follows:

- If f(n) is a sum of several terms, the one with the largest growth
  rate is kept, and all others omitted.

- If f(n) is a product of several factors, any constants (terms in the
  product that do not depend on n) are omitted.

### What's Bigger?

Look at the functions inside the big O to get a sense
of the comparative growth rates. Remember: we're concerned with the
behavior for large values of n. The smaller the y value when x is
large, the more efficient the algorithm.

Here are the complexities you should be familiar with:
- O(n!) - Factorial
- O(2^n) - Exponential
- O(n^3) - Cubic
- O(n^2) - Quadratic
- O(n * lg(n)) - Linearithmic
- O(n) - Linear
- O(lg(n)) - Logarithmic
- O(1) - Constant

![Alt](http://bigocheatsheet.com/img/big-o-complexity.png)

### Examples

1. n^2 + n:

Since n^2 grows faster than n, we can ignore the n and say that our algorithm is O(n^2)

2. 0.5 * n^2 + 200 * n:

Same as above, but we get to ignore constants. O(n^2)

3. 0.2 * n + lg(n)

We can ignore the constant, and n is bigger than lg(n). O(n)

### Additional References
[Cheat Sheet](http://bigocheatsheet.com/)  
[More Time Complexity](http://en.wikipedia.org/wiki/Time_complexity)  
[Video](https://www.youtube.com/watch?v=V6mKVRU1evU)  
[Stack Overflow Explanation](http://stackoverflow.com/questions/487258/plain-english-explanation-of-big-o)  
[A beginner's guide](http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/)
