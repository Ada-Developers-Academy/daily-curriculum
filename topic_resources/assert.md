# Assert and Assertions

Assertions are methods that we can use to verify our code. The idea
is very simple: We pass an expression that we believe is true to a
method called "assert" which then double checks the expression. If
the expression is false, #assert stops our program from continuing
by throwing an error.

So, the #assert method basically "asserts" that the thing we pass it
is true. That's it!

## Building assert()

Using the following as a basis, build an assert() method in Ruby:

- assert() takes a test and an optional message
- return true if the test is true
- error with the user's message (or a default) if the test is not true

```
def assert(test, msg = nil)
  ...
end
```

### Questions:

- How does assert behave when not passed a boolean expression?
- For that matter, how what qualifies as "true" in Ruby?

## Other Assertions

Using your assert() method, build assert_equal (easy!):

- assert_equal takes two expressions and an optional message
- assert_equal returns true iff the two expressions are equal
- assert_equal throws an error with the optional message if the expressions are not equal

### All The Things

- write assert_nil
- write assert_match (takes a regex and a string)
- write assert_includes
- make up your own assertion

## Why Do We Want This?

We will use asserts to reduce errors by verifying assumptions in our code, and as the basis
for automated tests.

### More Info

- [Invariants](http://en.wikipedia.org/wiki/Invariant_(computer_science))
- [TDD](http://en.wikipedia.org/wiki/Test-driven_development)
- [Deep Dive Example of TDD](http://www.rubyinside.com/screencast-coding-conways-game-of-life-in-ruby-the-tdd-way-with-rspec-5564.html)
