# FizzBuzz

Fizz buzz is a group word game for children to teach them about division. Players take turns to count incrementally, replacing any number divisible by three with the word "fizz", and any number divisible by five with the word "buzz".

Let's build a FizzBuzz! (as simple and readable as possible)

```ruby
# fizzbuzz.rb
1.upto(100).each do |n|
  if (n.to_f / 3).to_s.include?(".0") && (n.to_f / 5).to_s.include?(".0")
    string = "FizzBuzz"
  elsif (n.to_f / 3).to_s.include?(".0")
    string = "Fizz"
  elsif (n.to_f / 5).to_s.include?(".0")
    string = "Buzz"
  else
    string = n
  end
  puts string
end
```

Will this work? Let's look.

- **Pros**: no additional code required; humans are good at spotting patterns.
- **Cons**: humans are terrible at doing repetitive work quickly and accurately.

Next let's write a simple test to ensure this code works in `test_fizzbuzz.rb`

```ruby
# using backticks (`) allows code to be run by the system
output = `ruby ./fizzbuzz.rb`

if output == File.read("fizzbuzz_output.txt")
  puts "SUCCESS"
else
  puts "FAIL"
end
```

- **Pros**: automation FTW!
- **Cons**: still testing the entire program in one shot; error message possibly not all that helpful.

TDD
----

- Test First Development
- Test Driven Development
- Behavior Driven Development
- Growing Object Oriented Software, Guided by Tests (which is actually a book title)

(1) Write a test that describes some new feature of the software. Run the test, and watch it fail. (Watching it fail is crucial!) (2) Write code that makes all the tests pass. (3) Look for opportunities to simplify your code.

- Write a test
- Watch it fail
- Make it pass
- Simplify
- Repeat

You'll often hear this cycle shorthanded as "Red, Green, Refactor."

FizzBuzz w/TDD
-------------

We'll go back to FizzBuzz, but this time we'll build it up piece by piece. Let's start at the beginning: we want a series of numbers from 1 to 100, but those numbers may be transformed into some other set of values according to a set of rules. Not to lay too much math on you, but this sounds a lot like the definition of a function.

So, let's figure out the rules for a #fizzbuzz_of function using TDD steps.
