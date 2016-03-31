# Python V Ruby: Dawn Of Polyglottal Programming

## Significant Whitespace
Probably the biggest difference between Python and almost every other programming language is the concept of "(semantically) significant whitespace". Whitespace means any character in your code's text file that isn't normally visible (e.g. spaces, tabs, and endlines).

In Ruby all "blocks" of code are indicated by a beginning statement (such as `class`, `if`, or `do`) and a closing statement (always `end`). In Python the boundaries of a given block of code are determined based upon the *indentation* of the code.

For example, the following two code snippets are equivalent:

Ruby:
```ruby
def my_method
  a = 10
    if a < 20
    puts "this is poorly indented, but allowed"
  end
  method_call_outside_if
               end
```

Python:
```python
def my_method():
  a = 10
  if a < 20:
    print "this is correctly indented, otherwise it's a syntax error"
  method_call_outside_if()
```
