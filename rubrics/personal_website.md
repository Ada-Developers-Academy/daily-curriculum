#### Grading

This project will be graded according to:

- Proper use of HTML (30)
    - Required and recommended meta tags
    - Indentation
    - Organization
    - Proper Nesting
    - Required and recommended attributes on tags (check [HTMLDog](http://www.htmldog.com/reference/htmltags/) for usage)
- Visual alignment and layout (doesn't have to be pretty, just organized visually) (10)
- Proper use of external CSS file (30)
    - Indentation
    - Element Accessors
    - Syntax (`:`, `;`, spacing, etc...)
- Semi-advanced HTML/CSS (pick at least 3) (30)
    - Navigation Bar w/multiple links
    - Dropdown menu
    - Multiple columns (sidebar)
    - Fixed header
    - CSS background images
    - Background texture
    - Forms (doesn't *have* to be functional)
    - Properly use **all** 6 `h` tags
    - Use a table (only for appropriate data)
    - Link to / from another HTML page

### PERSONAL WEBSITE RUBRIC

1=Beginner, 2=Proficient, 3=Master

### PROJECT LEARNING GOALS

| Rating | Content           | Description
|--------|-------------------|-----------------------------------------------------------
|        | Layout            | The final result doesn't have to be pretty but all content should be organized visually.
|        | HTML/CSS          | HTML content includes required and recommended tags (check [HTMLDog](http://www.htmldog.com/reference/htmltags/) for usage). ([HTML Examples](#HTML)) Project uses external CSS file. Includes correct syntax ([CSS examples](#CSS)). Appropriately include at least three of the additional HTML/CSS items from the project definition.
|        | Variables                | Variable names are logical, clear, and in snake case. Variables are not needlessly assigned or reassigned. Instance variables are used for visibility within all methods in the class. Local variables are used for visibility only to a single code block or method.  ([variable examples](#variables)).
|        | Loops                    | Loops control the flow of the code, keeping the user on track, and continuing the program until an appropriate end point.
|        | Data Types               | Hashes, arrays, strings, symbols, numbers, and booleans used appropriately. ([data type examples](#data-types))
|        | Conditionals & Operators | Logical and mathematical operators guide program flow efficiently and properly deal with edge cases ([operator/conditional examples](#conditionals--operators)).
|        | Methods                  | Methods are designed and implemented with a single purpose. Methods are logically named in snake case.
|        | Classes                  | Classes are used to represent a single object, and contain all of the functionality and information associated with that object.

### Examples

#### HTML
```


```

#### CSS
```css
/* Good */
p {
    color: red;
    text-align: center;
}

.selector, /* each selector on a separate line */
.selector-secondary,
.selector[type="text"] {
  padding: 15px; /* Include one space after : */
  margin-bottom: 15px;
  background-color: rgba(0,0,0,.5);
  box-shadow: 0 1px 2px #ccc, inset 0 1px 0 #fff;
}

/* Bad */
p {
color: red
text-align: center
}

.selector, .selector-secondary, .selector[type=text] {
  padding:15px;
  margin:0px 0px 15px;
  background-color:rgba(0, 0, 0, 0.5);
  box-shadow:0px 1px 2px #CCC,inset 0 1px 0 #FFFFFF
}
```

#### Variables
```ruby
# Good:
post_height = 7.0
user_name = gets.chomp

class Item
  def initialize(item_name)
    @item_name = item_name
  end
end

# Bad:
p = 7
ph = '7.0'
postHeight = 77

class Item
  @item_name = # Incorrect usage outside of a method in class scope
end

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
|        | Readability    | Formatting is consistent. Naming conventions are followed. Use of white space and tabs are consistent. Code is concise. Each group of statements creates a complete thought and those thoughts are separated by blank lines. Variable, method and class names are meaningful. For CSS, place closing braces of declaration blocks on a new line.
|        | Structure      | Methods perform one, and only one, function. Blocks of code that are run multiple times are not cut-and-pasted, but instead are written as loops and functions. Variables are not duplicated unnecessarily. Strive to maintain HTML standards and semantics, but not at the expense of practicality. Use the least amount of markup with the fewest intricacies whenever possible.
|        | Efficiency     | There is no unused code or markup included.
|        | Comments       | Comments accurately describe code logic and are placed before or on the line they describe. Comments are either: information that can’t be expressed in code, intent comments, or summary comments.

###OVERALL RATING



###COMMENTS
