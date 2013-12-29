!SLIDE title-and-content transition=fade
Welcome To Ruby!
================
We're going to start working with Ruby! Ruby is a programming language and will be the foundation of most everything we learn for the next 3 months.

Like learning any new language, getting good at Ruby will just take practice. You'll find over time that there's nothing "magic" about programming - you're issuing commands that a computer understands and can execute.

!SLIDE title-and-content transition=fade
The History of Ruby
===================

Ruby is different than other programming languages. It was written with the human in mind, rather than the computer. Its creator, Yukihiro Matsumoto, wanted to create a programming language that was fun for programmers.

Ruby was first written in 1993 by Yukihiro "Matz" Matsumoto. Many of the design concepts were taken from Perl and SmallTalk. One of the unique things about Ruby is the core cultural principles associated with the language, much of which was influenced by Matz.

!SLIDE title-and-content transition=fade
Ruby is for People
==================

> "Programs are written for other people, and only incidentally for computers."

A well-written line of Ruby code can be read aloud, and a non-programmer should be able to understand it.

In the Ruby community, we try to focus on the people, not the machines.

!SLIDE title-and-content transition=fade
MINASWAN
========
### Matz Is Nice And So We Are Nice

!SLIDE title-and-content transition=fade
Ruby Community
==============

+ Railsbridge & Rails Girls
+ Ruby Nuby
+ Twitter
  + #fridayhug
  + #rubythanks
  + #rubyfriends


!SLIDE title-and-content transition=fade
Our First Textbooks
===================
We'll be using Beginning Ruby by Peter Cooper and Learn to Program to get ourselves acquainted with Ruby. 

!SLIDE title-and-content transition=fade
IRB
===

Ruby can be directly executed from your terminal using IRB (**I**nteractive **R**u **b**y). IRB is be a helpful tool for learning, quick computations, documentation, and debugging problems.


!SLIDE title-and-content transition=fade
Playing with IRB
================

From the command line, enter `irb`. Once you're in IRB:

* Try inputting a string, like "hello world".

!SLIDE title-and-content transition=fade
What happened???
================

Did we just write the world’s shortest “Hello World” program? Not exactly. The second line is just IRB’s way of telling us the result of the last expression it evaluated. If we want to print out “Hello World” we need a bit more.

!SLIDE text-size-80 title-and-content transition=fade
Free calculators for everyone!
==============================

* Try doing some arithmetic in irb
* 2 + 3
* 2 * 3
* 2 ** 3
* 4/3 (Note what Ruby does with the decimal places.)

!SLIDE text-size-80 title-and-content transition=fade
Math ain't hard!
================

Try this:

```
Math.sqrt(9)
```

* What's going on here?

!SLIDE text-size-80 title-and-content transition=fade
Basic Variables
===============
A **variable** is just like "X" from high school algebra. It's a placeholder that stands in for a value. It's like a little post office box can be a number, a string, a piece of code.. it doesn't care how big a thing you put inside it, but you can only put one thing in it at a time.

```
a = 3 ** 2
b = 4 ** 2
Math.sqrt(a+b) => 5.0
```
!SLIDE text-size-80 title-and-content transition=fade
Methods
============
We have to tell computers how to do every single step, but we don't have to tell them every step every single time.

```
def hello
  puts "Hello World!"
end
```

!SLIDE text-size-80 title-and-content transition=fade
Methods part 2
===================
What if we wanted to say hello to specific people, not just the whole world?

```
def hello(name)
  puts "Hello #{name}!"
end
```

!SLIDE text-size-80 title-and-content transition=fade
Basic Iterators
===============
An iterator does a piece of work over and over and over and over and over...

```
10.times do
  puts "Hello World!"
end
```



