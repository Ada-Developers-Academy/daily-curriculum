Intro to UNIX!
==============
This is a quick review of common tools and commands we'll be using every day!


What's a UNIX?
==============
We're all using OS X, which is a member of the family of operating systems known as nix. They're all based on an operating system called *UNIX* (originally UNICS). They all look and work more or less the same, with some minor differences that you don't need to worry about (until you do, by which time you'll know why it matters, I promise!)

Don't Be Afraid!
=====================
As a programmer, you'll need to become fluent with your computer's terminal. It's not as scary as it sounds, though!

Terminal
=====================

find the program 'Terminal' on your computer and open it

Most of us are used to GUI-based (<strong>G</strong>raphical **U**ser **I**nterface) operating systems like Windows or OS X, but a command line approach is much more effective for many tasks in programming. For example, Terminal will be the place where you'll navigate through and modify your files and folders (also called directories).

Bash
====
Your terminal is a command interpreter that connects to  a "shell", which is used for manipulating a computer. Bash, what we are using, is a UNIX Shell (<strong>B</strong>ourne **A**gain **Sh**ell). It's the default shell for Linux and OS X. Many of the functions and tools needed for Ruby development will be executed from bash.

Terminal Terminology
====================

**Console** - the system as a whole

**Command Line** - the actual line in the console where you type a command

**Prompt** - This is the beginning of the command line. It usually provides some contextual information like who you are, where you are and other useful info. It typically ends in a $ (this is represented in this lectures examples). After the prompt is where you will be typing commands.

**Terminal** - The program we use to interact with the console.

Running a Command
=================

Commands almost always have 3 parts.

```
[command] [options] [arguments]
```

You could think of it as

```
verb adverb noun
```

Let's look at one command

```
$ ls -a .
```

What *is* a Command?
====================

In UNIX commands are all tiny little programs. They tend to do one small job or task, with a variety of options. We'll be writing our own later on in this program!

In your Terminal, type

```
$ man ls
```
`man` is short for **man**ual.

\*using `man`, will enter a reading mode, a couple things to note about this mode:
- Normal commands will no longer work.
- `q` (for quit) exits this mode
- Up and down keys scroll.
- Space bar is page down

Navigation
==========
Getting around the directories of our computer is a snap!

```
$ pwd
/Users/Bookis/work/ada
```
`pwd` returns the **p**resent **w**orking **d**irectory. Use this command to find in which directory you are currently "in".

```
$ cd <some path>
```
`cd` is **c**hange **d**irectory. It's followed by some directory, if I were in `/Users/Bookis/work`:

```
$ pwd
/Users/Bookis/work
$ cd ada
$ pwd
/Users/Bookis/work/ada
```

#### Special Paths

```
$ cd ~
```
"~" represents your Home directory, for me this is "/Users/Bookis". As a shortcut, you can also just type `cd` with no directory at all.
```
$ cd .
```
A single "." represents the current directory, so cd . goes to where you already are.
```
$ cd ..
```
".." represents the parent directory, ".." from /Users/Bookis/work/ada is /Users/Bookis/work
```
$ cd ../../
```
Directories can be chained together, this goes up two directories.
```
$ cd -
```
A single "-" means to go back to the prior directory that you were in. This is different from the parent directory and more like the back button except it only keeps one directory of history. Running `cd -` again will toggle back and forth between the same two directories. This can be useful if you have a source directory and a documentation directory that you need to switch back and forth between.

Digging In
==========
Let's take a few minutes and use `man` to explore these commands.

+ `mkdir`
+ `touch`
+ `cp`
+ `mv`
+ `rm` (learn about the -r option!)
+ `less`

grep
====
### **G**lobal **R**egular **E**xpression **P**rint

Powerful command for searching files for strings of text. Although this may not seem like a terribly useful command at first, grep is considered one of the most useful commands in any *nix system.

Aliases
=======

As you get more comfortable with using Terminal, you'll notice that you start typing some things over and over again. We can use **aliases** to make life easier for us.


"Piping"
========

We can string commands together to create powerful compound commands. We can also use the greater-than character '>' to write the output of a command into a file.

```
printf "bananas\napples\npancakes\n"
printf "tacos\noranges\ncupcakes\n" > foods
cat foods
```

We use the pipe character '|' to send the output of one command on to the next one. 

```
printf "bananas\napples\npancakes\n" | grep "an"
cat foods | grep "an"
```

For the `grep` command the above can be written more simply as:

```
grep "an" foods
```

(Take note: This idea of chaining commands together is important in Ruby!)

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
