# Buffing up your Command Line skills

## BASIC COMMANDS
+ `man`
+ `pwd`
+ `ls -al`
+ `diff`, `vim -d`
+ `chmod`
+ `chown`
+ `cd`
+ `mv`
+ `cp /path/file.txt{,-old}`
+ `rm -rf`
+ `rmdir` / `mkdir`
+ `touch`
+ tab complete
+ `history | grep vim`
+ `clear`
+ `whoami`
+ `su`, `sudo`
+ `.` and `*`

# SOME MORE
+ `alias`
+ `sudo !!`
+ `ps`, `top`, `kill`
+ CTRL+Z / CTRL+C
+ [Wildcards, Quotes, Back Quotes and Apostrophes](http://www.codecoffee.com/tipsforlinux/articles/26-1.html)
+ [`grep`](http://www.codecoffee.com/tipsforlinux/articles/25.html)
+ [Pipes](http://www.codecoffee.com/tipsforlinux/articles/24.html)
+ [`find`](http://www.codecoffee.com/tipsforlinux/articles/21.html)
+ `head`, `tail`, `cat`, [`less` / `more`](http://cli.learncodethehardway.org/book/ex12.html) (less is more)

## VIM
+ `u`
+ `i`
+ `o`
+ esc
+ `:wq!`
+ `x`
+ `d`, `dw`, `dd`
+ `D`
+ highlight lines, then `:!sort`

## REGEX
+ In vim: `%s/lookingfor/whattomakeit/gc`
+ At command line: sed
+ `[abc]`	A single character of: a, b, or c
+ `[^abc]`	Any single character except: a, b, or c
+ `[a-z]`	Any single character in the range a-z
+ `[a-zA-Z]`	Any single character in the range a-z or A-Z
+ `^`	Start of line
+ `$`	End of line
+ `\A`	Start of string
+ `\z`	End of string
+ `.`	Any single character
+ `\s`	Any whitespace character
+ `\S`	Any non-whitespace character
+ `\d`	Any digit
+ `\D`	Any non-digit
+ `\w`	Any word character (letter, number, underscore)
+ `\W`	Any non-word character
+ `\b`	Any word boundary
+ `(...)`	Capture everything enclosed
+ `(a|b)`	a or b
+ `a?`	Zero or one of a
+ `a*`	Zero or more of a
+ `a+`	One or more of a
+ `a{3}`	Exactly 3 of a
+ `a{3,}`	3 or more of a
+ `a{3,6}`	Between 3 and 6 of a

# [Try It](try-it.md)

## FURTHER READING/EXPLORATION
+ [RegExOne Tutorial](http://regexone.com/)
+ [Cheatsheet reference](http://www.pixelbeat.org/cmdline.html) for several command line commands.
+ [Become a command line ninja](http://lifehacker.com/5743814/become-a-command-line-ninja-with-these-time-saving-shortcuts)
