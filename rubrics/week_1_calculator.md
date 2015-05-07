# CALCULATOR RUBRIC

1=Beginner, 2=Proficient, 3=Master

### PROJECT LEARNING GOALS

| Rating | Content           | Description
|--------|-------------------|-----------------------------------------------------------
|        | Variables                | Variables names are logical, clear, and in snake case. Variables are not needlessly assigned or reassigned ([variable examples](#variables)).
|        | Loops                    | While loops control the flow of the code, keeping the user on track, and continuing the program until an appropriate end point.
|        | Data Types               | Hashes, arrays, strings, symbols, numbers, and booleans used appropriately. ([data type examples](#data-types))
|        | Conditionals & Operators | Logical and mathematical operators guide program flow efficiently and properly deal with edge cases ([operator/conditional examples](#conditional--operators)).

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
|        | Correctness    | Code runs without errors or bugs, edge cases are tested for and dealt with, 
|        | Readability    | Formatting is consistent, naming conventions are followed, spacing vs tabs is consistent,
|        | Structure      | Methods are used to avoid code duplication,
|        | Efficiency     |
|        | Comments       | Comments accurately describe code logic and are placed before or on the line they describe.


###OVERALL RATING



###COMMENTS
