Brakeman
--------

Brakeman is an open source vulnerability scanner specifically designed for Ruby on Rails applications. It statically analyzes Rails application code to find security issues at any stage of development.

The Brakeman gem lives as a command-line tool on our computer, so we don't need to add it to our application via the `gemfile`.

```
$ gem install brakeman 
```

When run from the root directory of a Rails application, it will scan through our code and look for any known security problems.

```
$ brakeman
```

It will print out a list of all the different checks its performing, a summary of what its results, and then a table of the actual security issues that it uncovered.

Let's take a look at what Brakeman says about a few projects.

[live walk-through]

## Problems with Brakeman

Like all static analysis tools, Brakeman will give us the occasional false positive. Most of the apps we've built so far, being brand new and not amazingly complex, should have few (if any) security issues. 

Remember:

<img src=http://imgs.xkcd.com/comics/security.png>

## OMG how can I keep my Rails app safe?

New vulnerabilities are always being found, so application security is part of the ongoing maintenance costs of any piece of software. Here's some ways to minimize the costs.

+ Subscribe to the [Ruby on Rails Security Mailing List](https://groups.google.com/forum/#!forum/rubyonrails-security)
+ Stay current with [Rails patches](http://weblog.rubyonrails.org/) - updates come out every so often to fix bugs and security holes, and usually upgrading is well-documented and easy.
+ Keep Brakeman updated and run it frequently

## Resources

+ [Brakeman documentation](http://brakemanscanner.org/)
+ [Official Ruby on Rails Security Guide](http://guides.rubyonrails.org/security.html)
+ [The Inadequate Guide to Rails Security](https://www.honeybadger.io/blog/guides/2013/03/09/ruby-security-tutorial-and-rails-security-guide)
+ [Rails Security e-course](http://railssecurity.com/)
+ [Ruby Midwest 2013 Rails Application Security in Practice by Bryan Helmkamp](https://www.youtube.com/watch?v=TGbeIxf5RnI)
