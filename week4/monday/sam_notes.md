FizzBuzz
- Introduce the problem
  http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html
- ASK: would anyone like to take a stab at telling me what to type?  :)
- Live-code fizzbuzz.rb using very basic Ruby (keep it WET and
  readable!), but DO NOT EXECUTE IT!  Before running it, ask:
  - Can we reason about this code?  Do we think it'll work?  How will we
    know if we got it right?
- start with ~MANUAL INSPECTION~: run the code, look at its output.
    - Pros: no additional code required; humans are good at spotting patterns.
    - Cons: humans are terrible at doing repetitive work quickly and accurately.
- next, write a ~LOCKDOWN TEST~: in the file test_fizzbuzz.rb, run fizzbuzz.rb
    in backticks, capture output, compare with a reference version of the output.
    Add a line that outputs "Bug" if { Kernel.rand(100) < 5 }, use it to check the
    test.
    - Pros: automation FTW!
    - Cons: still testing the entire program in one shot; error message
      possibly not all that helpful; if running the program has other
      side effects, we'll get them every time.

REVIEW!

So, testing is a way to have some level of confidence that your code
does what you want it to do.  We've just seen a very small example of
what it looks like to write some code, then verify that it does what you
think it should do.  I want to emphasize that this approach is TOTALLY
LEGIT.

I sometimes still write code this way, even for my day job.  It works
particularly well for very small programs, especially the sort of
program that I'm going to throw away after an hour or two.

We've already seen two perfectly valid testing techniques:  manual
inspection and automated lockdown tests.  (I got the name "lockdown
test" from Katrina Owen, btw; it may not be a commonly used term.)

Does anybody else have ideas for other ways we might be able to write
automated tests for this code?  [...]  I honestly can't think of much
either; I think we've exhausted our options for testing this code as is.

I said a few moments ago that this works well for small programs that
I'm going to throw away after an hour or so.  For bigger, more
complicated projects, I use a different approach:  I actually write the
tests first.

This approach has several different names:
- Test First Development
- Test Driven Development
- Behavior Driven Development
- Growing Object Oriented Software, Guided by Tests (which is actually a
  book title)

Each of these names has a slightly different emphasis and may indicate
that someone is of a particular school of thought, but fundamentally,
all of these mean the same thing:  figure out how to make the computer
tell you when your code is working, then use that to check your work
as you go.

I first learned this from the book "Test-Driven Development By Example",
so you'll mostly hear me say "TDD".

It's not an exaggeration to say that this book changed my programming
career forever.  This technique was huge, and I've been using it every
day for eight or nine years.

Ready?

Here's the TDD workflow:

(1) Write a test that describes some new feature of the software.
    Run the test, and watch it fail.  (Watching it fail is crucial!)
(2) Write code that makes all the tests pass.
(3) Look for opportunities to simplify your code.

Repeat until finished.

WRITE THIS ON A FLIP CHART OR THE WHITEBOARD:
- Write a test
- Watch it fail
- Make it pass
- Simplify
- Repeat

For historical reasons, you'll often hear this cycle shorthanded
as "Red, Green, Refactor."  I'll explain that later, but I want to get
back to some code...

-----

FizzBuzz, take two

We'll go back to FizzBuzz, but this time we'll build it up piece by
piece.  Let's start at the beginning:  we want a series of numbers from
1 to 100, but those numbers may be transformed into some other set of
values according to a set of rules.  Not to lay too much math on you,
but this sounds a lot like the definition of a function.

So, let's figure out the rules for the #fizzbuzz_of function.

What's step 1?  (Wait for:  "write a test")

- NEW FILE:  test_fizzbuzz_of_function.rb
<<-RUBY
    require 'fizzbuzz_of_function.rb'

    actual = fizzbuzz_of(1)
    raise "FAILURE:  expected 1, but got #{actual}" unless actual == 1

    puts "SUCCESS!"
RUBY

What's step 2?  (watch it fail)

Okay.  Why did this fail?  [let someone figure out that we're requiring a
nonexistent file.  create file and run test again]

Okay.  Why did it fail now?  [let someone figure out that we haven't
defined #fizzbuzz_of.  define it with no args.  then define it with one
arg.]

Okay.  Why did it fail now?  [let them figure out that we expected 1,
but got nil.]

Anybody remember step 3?

[PAUSE FOR DRAMATIC EFFECT, THEN:  HARDCODE 1 AS THE RETURN VALUE]

And voila!  The tests pass!

At this point, I have a choice.  Technically, I have duplication
here:  the number '1' appears both in my test and in my code.  So I
could simplify the code by just returning the input parameter.
Sometimes, that's really obvious and I'll just skip this part... but
sometimes I'm working so hard that it's all I can do just to get to this
point.  At times like that, it's good to know how to take really tiny
steps, so I'm going to show you what that process looks like.

I'll defer step 4 for now, and go back to step 1:  add a test for
the next number in the sequence.  [Do so.]

Step 2:  watch it fail.
Step 3:  make it pass.
Step 4:  simplify.  I think this is about as simple as it gets.

Okay.  I'm feeling good.  I've got some momentum going.  Let's add a
test for fizzbuzz_of(3).

[FINISH the #fizzbuzz_of(n) method.  This can go as fast or as slow
as it needs to.  Consider deliberately introducing regressions.  Try not
to use the word "refactor".]

Okay.  We've got this fizzbuzz_of function, and we're satisfied that it
works as we intend.  Now let's go back and use it in our original code.
[EDIT test_fizzbuzz.rb, replace the guts of the loop with a call
to #fizzbuzz_of.]

[...]

Let's review, because we just introduced a lot of new ideas.

I just wrote code to solve the same problem, but I started by
writing a test first.  What effect did that have on my code?  [...]

-----

What do we notice about these tests?
- if we break several things, only the first one will fail
- individual tests aren't well defined:  whitespace and a pattern is our
  only key
- visual noise makes it hard to tell what each test is actually testing
- We might be inconsistent about failure messages
- Lots of copy/paste coding.  As a rule, when I find myself selecting a
  block of code and copying it, alarm bells start going off in my head.
  (Sometimes I like to imagine that I'm writing code on a keyboard where
  the Apple key and the C key are each hooked up to a car battery, and
  if I touch them both at the same time, I'll get a nasty electric
  shock.)
- might be order-dependent:  we can set up state in one test, modify
  it in a second test, and depend on that new state in a third test
- can't be run in parallel (partly because they *might* be
  order-dependent, and mostly because they're written as a Ruby script)
- don't have any progress indicators

Let's address some of these issues.

I'm going to start with the test failures.  Instead of saying "raise
message unless some condition", I'm going to say "assert some condition,
and raise this message if it ain't so."

[ extract #assert(condition, msg) ]

Right now, we have a big Ruby script that runs from top to bottom.
This makes it really easy to introduce bugs by sharing state between
tests.  (Comment out one of the "actual = fizzbuzz_of(3)" lines.)
What if we built up a list of tests, and ran each of them separately?

[ extract #test(description, &block). comment out "actual = " again. ]

Now that we've done that, we can print some progress indicators...

...and remember how I said those tests were order dependent?  What if we
ran them in randomized order every time?

...by the way, what if these are slow?  (Insert "sleep 0.5")
We could run them in parallel by putting each one inside a thread...
