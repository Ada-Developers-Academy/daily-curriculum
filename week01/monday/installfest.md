!SLIDE title-and-content transition=fade
Intro to Installfest!
=====================

Many of you will have these tools installed, but we're going to go through them together and make sure everyone is set to go.

+ If you've got pieces installed, help your fellow students!

!SLIDE title-and-content transition=fade

Xcode
=====================

First up, we need to install **Xcode**. Xcode is an **integrated development environment** (often called an **IDE**) for creating apps for Mac, iPhone, and iPad. We need it for some system tools, but won't be using it directly any time soon.


!SLIDE transition=fade

Xcode Command-Line Tools
========================

+ Run xcode
+ go to Preferences > Downloads > Components
+ click the download/install button
+ PROFIT!

!SLIDE  title-and-content transition=fade

Homebrew
========
Homebrew is a **package manager** that simplifies the installation of software on the Mac OS X operating system.

http://brew.sh/

!SLIDE  title-and-content transition=fade

Homebrew
========
+ Type this into your terminal:

```
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

+ Make sure everything installed correctly

```
$ brew doctor
```

!SLIDE  title-and-content transition=fade

GCC
===

```
$ brew tap homebrew/dupes
$ brew install apple-gcc42
```

+ We have to manually symlink it to the correct place for some pieces of software (booooo!)

```
sudo ln -s /usr/local/bin/gcc-4.2 /usr/bin/gcc-4.2
```

!SLIDE  title-and-content transition=fade

git
===
+ open source distributed version control system
```
brew install git
```

!SLIDE  title-and-content transition=fade

configuring git
===============
```
git config --global user.name "Your Actual Name"
git config --global user.email "Your Actual Email"
```

Use the same email address for heroku, git, github, and ssh.

!SLIDE  commandline transition=fade

Verify it!
==========
```
$ git config --get user.name
[Your Name]

$ git config --get user.email
[Your Email]
```


!SLIDE  commandline transition=fade

Colorize git
============
```
$ git config --global color.diff auto
$ git config --global color.status auto
$ git config --global color.branch auto
```
!SLIDE  title-and-content transition=fade

RVM
===
>RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.

+ http://rvm.io

!SLIDE  title-and-content transition=fade

RVM Installation
================

+ Install with

```
$ curl -L https://get.rvm.io | bash -s stable --autolibs=enabled
```

!SLIDE  title-and-content transition=fade

RVM Installation part 2
=======================
+ Read the output to find more information, troubleshooting, etc
+ You may need to run ```$ source $HOME/.rvm/scripts/rvm``` after
+ restart your terminal program

!SLIDE  title-and-content transition=fade

Installing Ruby
===============

## FINALLY!

```
rvm install 2.0.0
```

Set Ruby 2.0 as our default

```
rvm use 2.0.0 --default
```


!SLIDE  title-and-content transition=fade

Bundler and Rails
=================

```
gem install rails bundler --no-ri --no-rdoc
```


!SLIDE  commandline transition=fade

Trust, But Verify
=================

```
$ which ruby
/usr/local/rvm/rubies/ruby-2.0.0-p247/bin/ruby
```

```
$ rvm current
ruby-2.0.0-p247
```

```
$ rails -v
Rails 4.0.0
```

```
$ which rails
/usr/local/rvm/gems/ruby-2.0.0-p247/bin/rails
```

!SLIDE  title-and-content transition=fade

Text Editors
============
There are many options for text editors. Sublime Text, TextMate and Atom are popular **Graphic User Interface (GUI)** tools. **vim**, **vi**, and **emacs** are popular editors when working directly on a server. For this class, we'll start with Atom.

+ https://atom.io/
