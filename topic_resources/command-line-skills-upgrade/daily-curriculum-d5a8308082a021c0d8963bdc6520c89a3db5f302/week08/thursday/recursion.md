# Recursion

## What is Recursion?
Recursion, in the most common definitions, are methods that can call themselves until they reach a goal.

We say that a method is "recursive" if it

- Has an end goal, or base case
- Uses a process in which the task at hand is reduced towards that end goal

### Divide and Conquer

Recursion is useful as a way to divide a large problem into a smaller one. The most common way to explain recursion is to use it to calculate the factorial of a number. A factorial is the product of all positive integers less than or equal to the number. Therefor, the factorial of 5 is equal to 1*2*3*4*5. 

[an example](/examples/week8/recursion/factorials.rb)
```ruby
def factorial(num = 0)
  return "Can not calculate factorial of a negative number" if num < 0

  if num <= 1
    1
  else
    num * factorial(num - 1)
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

Often its not. If you find yourself saying "Geez, I wish I'd used a loop here" then you probably should. Sometimes, though, recursion is the best tool to use, and its the sort of solution that is worth learning, at least conceptually.

## Links

* [A King And His Rocks](http://ruby.bastardsbook.com/chapters/recursion/)
* [Ruby Recursion [VIDEO]](http://vimeo.com/24716767)
* [Flood Fill, Zombies, and Kittens](http://inventwithpython.com/blog/2011/08/11/recursion-explained-with-the-flood-fill-algorithm-and-zombies-and-cats/)
* [Fibonacci](http://kittykaraoke.tumblr.com/post/70391881556/fibonacci-with-memoization)
* [CodeQuiz on Recursion](http://www.codequizzes.com/topics/5/quizzes/7)

## Projects
(from http://www.theodinproject.com/courses/ruby-programming/lessons/recursion)
### Fibonnacci

The Fibonacci Sequence, which sums each number with the one before it, is a great example of a problem that can be solved recursively.

#### Your Task
  + Write a method #fibs which takes a number and returns that many members of the fibonacci sequence. Use iteration for this solution.
  + Now write another method #fibs_rec which solves the same problem recursively. This can be done in just 3 lines (or 1 if you're crazy).

### Coin Flips

How many different ways are there to flip a fair coin 5 times and not have three or more heads in a row? How about 10^10 times and not have 534 or more heads in a row?

