# Intoduction to Recursion

## Important Vocabulary
At the end of all of this, you should have a grasp on what these terms mean and how they fit together. This lecture is meant to be an introduction to these concepts.
- __Algorithm__: a self-contained, step-by-step set of operations performed to solve a specific problem.
- __Recursion__: a process where the solution depends on solutions to smaller instances of the same problem.
- __Call Stack__: a data structure that keeps track of the running routines in a program.
- __Memoization__: storing the result of an expensive operation as to avoid recomputing it.
- __Benchmark(ing)__: gathering metrics on the execution of code. Common metrics include time to complete, memory utilization, and object count.
- __Guard Clause__: a statement or block (often a conditional) that _guards_ against an edge case that would detrimentally affect an algortithm.


## So what is recursion?

Recursion is a process where the solution to a problem depends on solutions to smaller instances of the same problem.

We say that a method is _recursive_ if it:

- Calls itself in the process of completing its block.
- Has an end goal, or base case, that ends the recursion
- Has a process which reduces or alters the recurring task so that we progress toward the end goal

## Solve a big problem with a bunch of little problems

Recursion is useful as a way to divide a large problem into a smaller one. A common way to demonstrate recursion is to use it to calculate the factorial of a number. A factorial is the product of all positive integers less than or equal to the number. Therefor, the factorial of 5 is equal to `1 * 2 * 3 * 4 * 5`.

```ruby
def factorial(num = 0)
  # this is a guard clause
  return "Can not calculate factorial of a negative number" if num < 0

  if num <= 1
    1 # this is our base case
  else
    num * factorial(num - 1) # this is where the recursion happens
  end
end
```

This method returns the factorial of a number by first checking to see if the number is negative. If the number is positive, and is greater than 1, we multiply that number times the factorial of the number immediately preceding it. We could represent this as:

```
factorial(5)
  5 * factorial(4)
```

In this example, you can see that now we're calling ```factorial(4)```, so we add this to the stack, and we get:

```
factorial(5)
  5 * factorial(4)
    4 * factorial(3)
```

It just keeps going:

```
factorial(5)
  5 * factorial(4)
    4 * factorial(3)
      3 * factorial(2)
        2 * factorial(1)
```

...until we get to the condition where we would no longer call ```factorial``` -- when we ask for the factorial of 1, which is 1. At that point, we've hit the end, and we begin to return values for each call to the method.

```
factorial(5)
  5 * 24
    4 * 6
      3 * 2
        2 * 1
```

## Why is this better than a loop?

Often it's not. If you find yourself saying "Geez, I wish I'd used a loop here" then you probably should have. Sometimes though, recursion is the best tool to use. Knowing when to use and when to avoid recursion comes with practice, but we have tools to help us make that decision. Computing factorials, for example, can be done with or withot recursion; knowing which is better (a subjective word) means measuring the process.

## Exercise!

With your chair-pair, write an algorithm to compute factorials that __does not__ use recursion. We will look at a couple of your solutions, pick one we really like, and compare it to a recursive solution. The goal is to have a conversation in which we compaire two solutions on their design, readability, and efficiency.

## Thinking about the Call Stack: Recursive Fibonnacci

The Fibonacci Sequence, which sums each number with the one before it, is a great example of a problem that can be solved recursively. Let's live code it!

# Further Reading

* [A King And His Rocks](http://ruby.bastardsbook.com/chapters/recursion/)
* [Ruby Recursion [VIDEO]](http://vimeo.com/24716767)
* [Flood Fill, Zombies, and Kittens](http://inventwithpython.com/blog/2011/08/11/recursion-explained-with-the-flood-fill-algorithm-and-zombies-and-cats/)
* [Fibonacci](http://kittykaraoke.tumblr.com/post/70391881556/fibonacci-with-memoization)
* [Example code for this lecture](https://gist.github.com/jnf/e8493c9f40fddcd20038)
