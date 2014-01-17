!SLIDE title-and-content transition=fade
Intro to *NIX!
==============
This is a quick review of common tools and commands we'll be using every day!


!SLIDE title-and-content transition=fade
What's a *NIX?
==============
We're all using OS X, which is a member of the family of operating systems known as *nix. They're all based on an operating system called *UNIX* (originally UNICS). They all look and work more or less the same, with some minor differences that you don't need to worry about (until you do, by which time you'll know why it matters, I promise!)

!SLIDE title-and-content transition=fade
Don't Be Afraid!
=====================
As a programmer, you'll need to become fluent with your computer's terminal. It's not as scary as it sounds, though! 

!SLIDE title-and-content transition=fade
Terminal
=====================

+ find the program 'Terminal' on your computer and open it

Most of us are used to GUI-based (<strong>G</strong>raphical **U**ser **I**nterface) operating systems like Windows or OS X, but a command line approach is much more effective for many tasks in programming. For example, Terminal will be the place where you'll navigate through and modify your files and folders (also called directories).

!SLIDE title-and-content transition=fade
Bash
====
Your terminal is a command interpreter that connects to  a "shell", which is used for manipulating a computer. Bash, what we are using, is a UNIX Shell (<strong>B</strong>ourne **A**gain **Sh**ell). It's the default shell for Linux and OS X. Many of the functions and tools needed for Ruby development will be executed from bash.

!SLIDE text-size-90 title-and-content transition=fade
Terminal Terminology
====================

**Console** - the system as a whole

**Command Line** - the actual line in the console where you type a command

**Prompt** - This is the beginning of the command line. It usually provides some contextual information like who you are, where you are and other useful info. It typically ends in a $ . After the prompt is where you will be typing commands.

**Terminal** - The program we use to interact with the console.

!SLIDE text-size-90 title-and-content transition=fade
Running a Command
=================

Commands almost always have 3 parts.

```[command] [options] [arguments]```

You could think of it as

```verb adverb noun```

Let's look at one command

``` ls -a .```

!SLIDE text-size-90 title-and-content transition=fade
What /is/ a Command?
====================

In *NIX commands are all tiny little programs. They tend to do one small job or task, with a variety of options. We'll be writing our own later on in this program!

In your Terminal, type

```man ls```

!SLIDE text-size-90 title-and-content transition=fade
Navigation
==========
Getting around the directories of our computer is a snap!

+ pwd
+ cd
  + ~
  + ..
  + ../../

!SLIDE text-size-80 title-and-content transition=fade
Digging In
==========
Let's take a few minutes and use ```man``` to explore these commands.

+ mkdir
+ touch
+ cp
+ mv
+ rm (learn about the -r option!)
+ less 

!SLIDE title-and-content transition=fade
grep
====
### **G**lobal **R**egular **E**xpression **P**rint

Powerful command for searching files for strings of text. Although this may not seem like a terribly useful command at first, grep is considered one of the most useful commands in any *nix system.

!SLIDE text-size-90 title-and-content transition=fade
Aliases
=======

As you get more comfortable with using Terminal, you'll notice that you start typing some things over and over again. We can use **aliases** to make life easier for us.


!SLIDE text-size-90 title-and-content transition=fade
"Piping"
========

We can string commands together to create powerful compound commands. We use the pipe character '|' to send the output of one command on to the next one.

```
grep -irn banana .|grep -v Pie
```

(Take note: This idea of chaining commands together is important in Ruby!)

!SLIDE text-size-70 title-and-content transition=fade
What Did We Learn?
==================
* Show folders and files in your current directory
* Show your current location
* Change directories
* Open files
* Create new files and directories
* Copy files to different directories
* Move files to different directories
* Remove files and directories
* Basic use of grep








