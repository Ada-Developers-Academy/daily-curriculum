Intro to Installfest!
=====================

Many of you will have these tools installed, but we're going to go through them together and make sure everyone is set to go.

Follow the steps below, typing any necessary code into the Terminal application.

If you've got pieces installed, help your fellow students!

Xcode Command-Line Tools
========================
Xcode is an **integrated development environment** (often called an **IDE**) for creating apps for Mac, iPhone, and iPad. We don't need it in it's entirety, we're just going to download the Command Line Tools it provides.

```
xcode-select --install
```

Walk through the installation, it will take a few minutes.

You will receive an error during the “Finding Software” stage, this means that you already have the tools installed. All good. But to double check your installation run

```
xcode-select -p
```

You should get something like `/Applications/Xcode.app/Contents/Developer` or `/Library/Developer/CommandLineTools`.

Homebrew
========
Homebrew is a **package manager** that simplifies the installation of software on the Mac OS X operating system.

http://brew.sh/

Homebrew
========
Type this into your terminal:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

You may need to enter your computer password if you have one set.

Make sure everything installed correctly

```
brew doctor
```

git
===
+ open source distributed version control system
```
brew install git
```

configuring git
===============
```
git config --global user.name "Your Actual Name"
git config --global user.email "Your Actual Email"
```

Use the same email address for heroku, git, github, and ssh.

Verify it!
==========
```
git config --get user.name
[Your Name]

git config --get user.email
[Your Email]
```


Colorize git
============
```
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
```
RVM
===
>RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.

+ http://rvm.io

RVM Installation
================

+ Install with

```
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled
```

RVM Installation part 2
=======================
+ Read the output to find more information, troubleshooting, etc
+ You may need to run ```source $HOME/.rvm/scripts/rvm``` after
+ restart your terminal program

Installing Ruby
===============

## FINALLY!

```
rvm install 2.2.3
```

Set Ruby 2.2 as our default

```
rvm use 2.2.3 --default
```


Bundler and Rails
=================

```
gem install rails bundler --no-ri --no-rdoc
```


Trust, But Verify
=================

```
which ruby
/usr/local/rvm/rubies/ruby-2.2.3/bin/ruby
```

```
rvm current
ruby-2.2.3
```

```
rails -v
Rails 4.2.4
```

```
which rails
/usr/local/rvm/gems/ruby-2.2.3/bin/rails
```

Text Editors
============
There are many options for text editors. Sublime Text, TextMate and Atom are popular **Graphic User Interface (GUI)** tools. **vim**, **vi**, and **emacs** are popular editors when working directly on a server. For this class, we'll start with Atom.

+ https://atom.io/
