# Merge Sort

Merge sort is a recursive, divide and conquer sort algorithm. The idea
of merge sort is pretty simple:

1. Divide your list into two lists.

1. If the lists have zero or one elements, they're sorted.

1. Otherwise, sort each of those lists recursively with merge sort.

1. Once those lists are sorted, we *merge* them together in sorted order.

## The Merge Operation

Assuming that you have two sorted lists, what does the merge operation
look like? The solution is similar to the intuitive approach:

1. Create a new list for the merge.

1. Compare the first item of the two lists.

1. Take the smallest of the two items from the *head* of its list and
   add it to your new list.

1. If one of the lists is empty, use the item from the other list.

1. Repeat from #2 until both lists are empty.

## The Magical Magic

![A magical unicorn](http://img1.wikia.nocookie.net/__cb20090425203919/monster/images/c/c4/Unicorn.jpg)

This is where merge sort starts to seem magical: once we have our
merge operation, we're basically done. Try it out with pencil and paper!
