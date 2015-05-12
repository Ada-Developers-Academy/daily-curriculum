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

FizzBuzz w/TDD
-------------

We'll go back to FizzBuzz, but this time we'll build it up piece by piece. Let's start at the beginning: we want a series of numbers from 1 to 100, but those numbers may be transformed into some other set of values according to a set of rules. Not to lay too much math on you, but this sounds a lot like the definition of a function.

So, let's figure out the rules for a #fizzbuzz_of function using TDD steps.

Resources
----------
[Rspec Cheat Sheet](https://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf)
[Rspec docs](https://www.relishapp.com/rspec)
