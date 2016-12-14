# RANDOM MENU GENERATOR RUBRIC

1=Beginner, 2=Proficient, 3=Master

### PROJECT LEARNING GOALS

| Rating | Content           | Description
|--------|-------------------|-----------------------------------------------------------
|        | Variables                | Variables names are logical, clear, and in snake case. Variables are not needlessly assigned or reassigned ([variable examples](#variables)).
|        | Loops                    | Loops control the flow of the code, keeping the user on track, and continuing the program until an appropriate end point.
|        | Data Types               | Hashes, arrays, strings, symbols, numbers, and booleans used appropriately. ([data type examples](#data-types))
|        | Conditionals & Operators | Logical and mathematical operators guide program flow efficiently and properly deal with edge cases ([operator/conditional examples](#conditionals--operators)).

### Examples or somesuch

#### Variables
```ruby
# Good:
post_height = 7.0
user_name = gets.chomp

# Bad:
p = 7
ph = '7.0'
postHeight = 77
```

#### Conditionals & Operators
```ruby
x = 2

# Good:
if x < 2
  result = "x is less than 2"
elsif x > 2
  result = "x is greater than 2"
else
  result = "x is exactly 2"
end

puts result

# Bad:
if x < 2
  result = "x is less than 2"
elsif x > 2
  result = "x is greater than 2"
end

puts result

```

#### Data Types
```ruby
# Good:
name = "Bobbina"
honorific = "Ms. #{name}"

# Bad:
num = '2'
total = 1 + num.to_i
```

### CODE QUALITY

| Rating | Skill          | Description
|--------|----------------|-----------------------------------------------------------
|        | Correctness    | Code runs without errors or bugs. Edge cases are tested for and handled appropriately.
|        | Readability    | Formatting is consistent. Naming conventions are followed. Use of white space and tabs are consistent. Code is concise. Each group of statements creates a complete thought and those thoughts are separated by blank lines. Variable names are meaningful.
|        | Structure      | Blocks of code that are run multiple times are not cut-and-pasted, but instead are written as loops. Variables are not duplicated unnecessarily.
|        | Efficiency     | There is no unused code included.
|        | Comments       | Comments accurately describe code logic and are placed before or on the line they describe. Comments are either: information that can’t be expressed in code, intent comments, or summary comments.

###OVERALL RATING



###COMMENTS
