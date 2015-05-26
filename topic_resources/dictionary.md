# Scrabble Dictionary

In the [dictionary folder](../topic_resources/dictionary) is a Words class which can be used via the following interface:

```ruby
require 'words'

w = Words.new
word = w.next_word # returns the next word in the word list
w.remaining_words  # returns the number of words remaining
```

The Words class has two limitations:

- The Words class does not return words in a sorted order (and while
  each instance returns the words in the same order, this is not a
  guaranteed part of its interface).

- The Words class cannot be rewound. That is: once we call
  ```w.next_word``` we can either keep calling it until we've gotten
  all the words out, or we have to start over from the beginning with
  a new instance

For this project, we can't modify words.rb! This is an example of
programming to an interface--we're often given 3rd party libraries
that are out of our control. words.rb is owned by a different team at
ScrabbleCo who may change what words it has access to and how it gets
its words at any time.

## Breakfast

#### Hash backed `Dictionary` class

Build a Dictionary class that stores all the words from words.rb in a hash and
has a method to check whether or not a given word is valid. Use BDD
(write specs) to check your import (total words should match) and
your word checking method.

#### Questions

- What is the time complexity of the import?
- What is the space complexity of the backing store?
- What is the time complexity of a word check?

## Lunch

#### Array backed `Dictionary` class

Import the same word list into an array backing store. Use linear
search in your word check method.

Try using benchmark to compare the performance of this new Dictionary
with the Hash-backed Dictionary.

#### Questions

- What is the time complexity of the import?
- What is the space complexity of the backing store?
- What is the time complexity of a word check?
- Is this better or worse than our last version?

## Dinner

#### Sorted Array backed `Dictionary` class

Use insertion sort to build a sorted Array backing store. Your backing
store should remain sorted during import (without using Array#sort!),
and should be able to handle adding words later without becoming
unsorted. Use the word check method from Silver.

The key is to just make sure we put things in the correct place when
we add them!

#### Same Ole Questions

- What is the time complexity of the import?
- What is the space complexity of the backing store?
- What is the time complexity of a word check?
- Is this better or worse than our last version? The first version?

## Dessert

#### Binary Search

Rewrite your word check to use binary search.

#### Questions
- How many steps does it take on average to find a word?
