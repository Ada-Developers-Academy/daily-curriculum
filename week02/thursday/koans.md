# Ruby Koans

We're going to be taking a look at Ruby and some other CS concepts
with a slightly modified version of the
[Ruby Koans](http://rubykoans.com/).

> The Koans walk you along the path to enlightenment in order to learn Ruby. The goal is to learn the Ruby language, syntax, structure, and some common functions and libraries. We also teach you culture. Testing is not just something we pay lip service to, but something we live. It is essential in your quest to learn and do great things in the language. -- Ruby Koans

## Installing the Koans

First, clone the Ada version of the Koans from our repo:

```
$ git clone git@github.com:Ada-Developers-Academy/ruby_koans.git
```

cd into the directory, and generate the koans:

```
$ cd ruby_koans
$ rake gen
```

This will generate koans koans for you to work on in the koans
directory.

## Red, Green, Refactor

In test-driven development (TDD) the mantra has always been red: write
a failing test and run it, green: make the test pass, and refactor:
look at the code and see if you can make it any better.

With the koans, you will need to run the tests and see it fail (red),
make the test pass (green), then take a moment and reflect upon the
test to see what it is teaching you and improve the code to better
communicate its intent (refactor).

## Running the koans

To run the koans, you simply run ```rake``` in the main repo directory
and follow the instructions:

```
$ rake
/Users/dean/.rvm/rubies/ruby-2.1.2/bin/ruby path_to_enlightenment.rb
AboutAsserts#test_assert_truth has damaged your karma.

The Master says:
  You have not yet reached enlightenment.
  Do not lose hope.

The answers you seek...
  Failed assertion.

Please meditate on the following code:
  ./ruby_koans/koans/about_asserts.rb:10:in `test_assert_truth'

mountains are merely mountains
your path thus far [X_________________________________________________] 0/282
```

The first test has failed. Note that the testing framework (in this
case the koans) has told you where the error is:

```
Please meditate on the following code:
  ./koans/about_asserts.rb:10:in `test_assert_truth'
```

To make the test pass, open ```./koans/about_asserts.rb``` in your
editor, and look at line 10.

## Updating the koans

We'll be adding koans as we progress through the course. To update
your version of the koans, pull from master and run ```rake gen```:

```
$ git pull
$ rake gen
```

**WARNING Your work in the koans directory is ignored by git by default!**

