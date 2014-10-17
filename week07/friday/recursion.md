# Recursion

## International Charity

Suppose you are the head of an international charity, tasked with
raising $1MM. How do you raise the money if donations are generally
$100 or less?

### Iterative Solution

Ask 10,00 people for $100 in turn.

### Recursive Solution

Delegate the problem of raising $100,000 to 10 regional
directors. Those 10 directors can then *recursively* delegate the task
of raising $10,000 to 10 county directors, who can recursively
delegate the task of raising $1000 to 10 city volunteers who can
(hopefully) each find 10 $100 donations.

Recursion works by dividing a problem into similar sub-problems and
combining the results.

## Divide and Conquer

**Divide** the problem into sub-problems that are smaller versions of
  the initial problem.

**Conquer** the sub-problems by solving them recursively (see above).

**Combine** the solutions to the sub-problems into the solution to
  each sub-problem, until you have the solution for the original
  problem.

## Base Case

In order for recursion to work, you need to have what is called a
*base case*. Base cases are small problems that are trivial to
solve. We divide up our original problem into smaller problems until
we reach base case.

In the charity example, a $100 donation is the base case. We divide
the collection amount by 10 at every level until we have a large
number of volunteers each trying to collect $100 donations.

## Fibonacci Numbers

The Fibonacci numbers (or Fibanacci sequence) are defined as a series
of numbers beginning with 0 and 1 (alternatively, 1 and 1), and such that:

```
Fib(0) => 0
Fib(1) => 1

Fib(n) = Fib(n-1) + Fib(n-2)
```

Based on the above rules, here's a table with the first few Fibonacci
numbers:

| n     | Fib(n)| Calculation |
|-------|:-----:|-------------|
|0      |0      | 0 (base case)|
|1      |1      | 1 (base case)|
|2      |1      | Fib(1) + Fib(0) == 1 + 0        |
|3      |2      | Fib(2) + Fib(1) == 1 + 1        |
|4      |3      | Fib(3) + Fib(2) == 2 + 1        |
|5      |5      | Fib(4) + Fib(3) == 3 + 2        |
|6      |8      | Fib(5) + Fib(4) == 5 + 3        |
|7      |13     | Fib(6) + Fib(5) == 8 + 5        |
|8      |21     | Fib(7) + Fib(6) == 13 + 8       |
|9      |34     | Fib(8) + Fib(7) == 21 + 13      |

and so on.

Since the Fibonacci numbers are based on a *trival base case*
(```Fib(0)``` and ```Fib(1)```), and a *recursive decomposition* that
defines ```Fib(n)``` in terms of ```Fib(n - 1)``` and ```Fib(n -
2)```, fib is a great candidate for a recursive implementation:

```
def fib(n)
  if n <= 0    # base case
    0
  elsif n == 1 # base case
    1
  else
    # add together recursive calls to fib(n-1) and fib(n-2)
    fib(n - 1) + fib(n - 2)
  end
end
```

## Binary Search

Here's a recursive implementation of binary search on an
array. Remember: binary search requires the array to be sorted ahead
of time. We use the fact that the array is sorted to deompose it into
two smaller arrays, which we can then do binary_search on recursively.

This version returns the index of the position to insert the ```num``` in a
sorted array ```ar```.

```
def bin_search_guess(ar, num)
  # base case!
  return 0 if ar.length == 0
  mid = ar.length / 2

  # if the middle item is correct, return it.
  if ar[mid] == num
    mid
  elsif num < ar[mid]
    # if our middle item is high, recurse with the lower half of the
    # array as the argument
    bin_search_guess(ar[0...mid], num)
  else
    # otherwise recurse with the upper half of the array as the argument
    mid + bin_search_guess(ar[mid + 1..ar.length], num)
  end
end
```

## Last but not least

Here's a screenshot of the version of linear search that we wrote in
class using recursion.

```
def is_in?(ar, n)
  puts "is_in? called with : #{ar} - #{n}"
  if ar.length == 0
    false
  elsif ar.length == 1
    ar[0] == n
  else
    sub_ar_1 = ar[0...1]
    sub_ar_2 = ar[1..-1]
    is_in?(sub_ar_1, n) or is_in?(sub_ar_2, n)
  end
end
```
![recursing](recursion.png)
