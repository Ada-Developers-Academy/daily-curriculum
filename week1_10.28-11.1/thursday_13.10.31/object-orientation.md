# Object Orientation: Classes, Instances, and Methods

## Overview
Rubyists always say "in Ruby, everything is an object." From a beginner's perspective, that's quite confusing. Objects know information, called attributes, and they can do actions, called methods. A more useful statement than "everything is an object" could be "everything has attributes and methods."

For an example of an object, think about you as a human being. You have attributes like height, weight, and eye color. You have methods like "walk", "run", "talk", and "walk backwards." Different kinds of objects have different attributes and methods. 

A class is an abstract idea. It defines what all objects of that type can know and do. Think of the chair you’re sitting in. It’s not an abstract chair, it is an actual chair. We’d call this actual chair an instance - it is a realization of the idea chair. It has measurable attributes like height, color, weight. The class chair, on the other hand, has an abstract weight, color, and size – we can’t determine them ahead of time.

We'll start with something that *could* be a physical object, like a Chair. First let's define a couple things.

    class Chair
      def name
        "Vilgot"
      end  
  
      def weight_in_lbs
        29
      end
  
      def type
        "Swivel"
      end
  
      def color
        "Black"
      end
  
      def max_height
        23.625
      end
    end

+ Chair (Class)
+ Chair.new (returns an instance of the `Chair` class)
+ Chair.new.name => "Vilgot" (an instance of the class `String`)
+ Chair.new.weight_in_lbs => 29 (an instance of the class `Integer`)

## Frequently-Used Objects
In the last section, we said *everything is an object*. This is a confusing concept at first, but let's go over a couple of examples to highlight that point.

We're already familiar with strings and integers. Strings and integers are objects, too! Try `"hello".class` in IRB. What do you get? 

Just like our Chair class, which defined the abstract idea of a chair, there's a String class that defines the abstract idea of string. The same is true for `2.class` (Fixnum) and `2.3.class` (Float). 

Even classes have classes! Try `"hello.class.class"`!

Commonly-used classes have pre-defined methods baked in - that's how Ruby works from the inside out. To see what methods are available on any object, just call `.methods`. Try it with `"hello".methods`.

Just to go further down the rabbit hole, the response of `"hello.methods"` is even an object, so you can call `.class` on it. Turns out that it is an Array (which is an object type we'll get to very soon).

We can use Array's predefined methods on `"hello".methods`, like `.count`. `"hello".methods.count` will give us the number of methods you can call on any string. How many are there?

## Lesson

Build the Dungeon Text Adventure game outlined on page 149-158 in Beginning Ruby

## Optional Lesson: More About Methods
Can't get enough methods? Check out Chapter 6 of Learn to Program. It'll go over some common (and not-so-common) methods for some of our favorite types of objects: integers and strings. 