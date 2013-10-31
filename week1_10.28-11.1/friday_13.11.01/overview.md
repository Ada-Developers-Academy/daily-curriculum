!SLIDE transition=fade

Friday, October 28
==================
### Morning

| Time              | Topic            |
:-------------------|:-----------------|
| **9:15 - 9:30**   | Standup          |
| **9:30 - 11:30**  | Ruby 103 - Files |
| **11:30 - 12:00** | PB & Jelly game  |
| **12:00 - 1:00**  | Staff Meeting    |

### Afternoon

| Time            | Topic                       |
:-----------------|:----------------------------|
| **1:00 - 2:30** | Promoting Our Class         |
| **2:30 - 3:30** | Week One Blog Post          |
| **3:30 - 4:00** | Quiz                        |
| **4:00 - 5:00** | Week One Retro and Cupcakes |


!SLIDE title-and-content transition=fade

Oh, hello! 
================
![Elise](/images/elise.jpg "Elise")  

![Cheri](/images/cheri.jpg "Cheri")

!SLIDE title-and-content transition=fade
Promoting Our Class
===================

- Our Public Culture  
- BSP (Blatant Self Promotion)  
- Social Media

!SLIDE title-and-content transition=fade
How Should We Represent Ourselves?
===================

- We're the first cohort and get to define Ada's public identity
- Our website needs some work (and personalization)
- <http://adadevelopersacademy.org>

!SLIDE title-and-content transition=fade
Website Suggestions
===================

- Name
- Photo
- Bio
- Github Handle
- Link to Your Own Blog (soon)
- Anything else?

!SLIDE title-and-content transition=fade
Pair Bio Writing
===================

- Less than 150 words
- Ideas:
  - What got you into programming?
  - What are you passionate about?
  - What's your professional/educational background?
- Examples: <http://rubyconf.org/program>  

!SLIDE title-and-content transition=fade
Submit it on GitHub
===================

- Write the bio in markdown
- Fork <the repo> 
- Submit a pull request to fill in the section  

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



