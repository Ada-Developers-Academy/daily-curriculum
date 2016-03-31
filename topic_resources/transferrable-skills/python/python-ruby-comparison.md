# Python V Ruby: Dawn Of Polyglottal Programming

## Significant Whitespace
Probably the biggest difference between Python and almost every other programming language is the concept of "(semantically) significant whitespace". Whitespace means any character in your code's text file that isn't normally visible (e.g. spaces, tabs, and endlines).

In Ruby all "blocks" of code are indicated by a beginning statement (such as `class`, `if`, or `do`) and a closing statement (always `end`). In Python the boundaries of a given block of code are determined based upon the **indentation** of the code.

For example, the following two code snippets are equivalent:

Ruby:
```ruby
def my_method
  a = 10
    if a < 20
    puts "this is poorly indented, but allowed"
  end
  call_outside_if
               end
        call_outside_method
```

Python:
```python
def my_method():
    a = 10
    if a < 20:
        print "this is correctly indented, otherwise it's a syntax error"
    call_outside_if()
call_outside_method()
```

While this choice by Python has major benefits for readability, and doesn't ever require hunting down which `end` matches up with which `if` or `def`, it does have a couple of drawbacks.

Firstly, if you want to have an "empty" block of code, you'll need to use the `pass` statement:
```python
def empty_method():
    pass
```

More importantly, you'll need to make sure that you **NEVER** mix tabs and spaces in the same file! Because a tab character is generally indicated in your code editor as a certain number of spaces (usually 2, 4, or 8) it's not immediately obvious when a given line contains some mix of tabs and spaces.

The Python interpreter knows the difference however, and will not consider a line with mixed tabs and spaces to be the same as a line with only spaces -- even if they look exactly the same in your editor.

So, should you use tabs or spaces? It kind of depends on what project you're working on -- you should always match whatever style is currently in use. However, if you're just starting out with a new project you should definitely follow the **official style guide** for Python (which recommends exactly 4 spaces per indentation "level").

The official style guide is called **PEP8** (Python Enhancement Proposal 8), and [you can find it here](https://www.python.org/dev/peps/pep-0008/). Most every code editor will include a syntax checker which conforms to the PEP8 standard, and you should use it. Even if you're not using the official 4 spaces recommendation, there are many other aspects of writing Python code which it covers, and you should try to follow as many of them as you can.


## Class defintions, instance and class methods

```ruby
class Parent
end

class Child < Parent
  def initialize(name)
    @name = name
  end

  def say_name
    puts "My name is #{name}"
  end

  def self.class_method
    puts "This is a class method on #{self}"
  end
end

angela = Child.new("Angela")
angela.say_name
Child.class_method
```

Python:
```python
class Parent:
  pass

class Child(Parent):
    def __init__(self, name):
        self.name = name
    # There is whitespace here!
    # instance methods in Python always take a "self" parameter
    def say_name(self):
        print "My name is %s" % self.name
    
    @classmethod
    def class_method(cls):
        print "This is a class method on %s" % cls
        print "Class methods are just instance methods that have the @classmethod 'decorator' above them"
        print "In class methods we also name the first parameter 'cls' instead of 'self' because it represents the class, not an instance"

angela = Child("Angela")
angela.say_name()
Child.class_method()
```
