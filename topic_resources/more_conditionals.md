# More Conditionals
We've already seen how to do conditionals with the `if elsif else end` construct, and how to do conditional looping with the `while end` construct. There are however, a couple of additional ways to use conditions and comparisons in your code.

## Ternary Operator
Similarly to how the `+` in `+10` is a *unary* operator, and the `*` in `10 * 5` is a *binary* operator, there is also a *ternary* operator. This operator is not mathematical in nature, but is instead a logical operation, equivalent to `if`:

```ruby
if x == 10
  puts "It's 10!"
else
  puts "It's not 10!"
end

if y > 5
  z
else
  w
end
```
this is the same as:

```ruby
x == 10 ? (puts "It's 10!") : (puts "It's not 10!")

y > 5 ? z : w
```

## Single-line Conditionals
When you have short piece of code that you want to run only under a particular condition, you can use an `if`:

```ruby
if argument == nil
  raise ArgumentError
end
```

However, this has turned a very short line into three lines... which is more typing than we want. Helpfully, Ruby lets us write this more tersely with a single line:

```ruby
raise ArgumentError if argument == nil
```


## Logical Compound Operators
Previously we've seen the mathematical *compound operators*:
- `+=`
- `-=`
- `*=`
- `/=`

There are also two _logical_ compound operators:
- `||=`
- `&&=`

These work the same way as their mathematical cousins, they translate into a longer form of code that means the same thing:

```ruby
tacos = false
sandwich = true

lunch = tacos
lunch ||= sandwich
# The above two lines could be written as:
lunch = tacos
lunch = lunch || sandwich
```

```ruby
answer_1_correct = true
answer_2_correct = true
answer_3_correct = false

all_answers_correct = answer_1_correct
all_answers_correct &&= answer_2_correct
all_answers_correct &&= answer_3_correct
# The three lines above could be written as:

all_answers_correct = answer_1_correct
all_answers_correct = all_answers_correct && answer_2_correct
all_answers_correct = all_answers_correct && answer_3_correct
```
