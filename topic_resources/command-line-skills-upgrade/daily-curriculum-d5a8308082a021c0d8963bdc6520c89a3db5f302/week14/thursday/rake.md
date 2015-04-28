# Rake

Rake (ruby make) is a tool to run tasks (ruby). Rake tasks are typically
defined in a file called `Rakefile`. Rails creates this file for you, but
you can manually add it to any ruby project. In rails the `Rakefile` will
already have some defaults in there. Let's add a task, at the bottom of
the file:

```ruby
task :test do
  puts "I'm a rake task"
end
```

So, let's make this rake task do something. Let's imagine our club
manager needs a list of all of the clubs that we market for, but he
doesn't use the internet so we need to fax him a copy of all of the
clubs. We'll make a task that uses ruby to create a new file named
`clubs.txt` then print all of the club names into the file:

```ruby
task :test do
  puts "writing file"
  File.open("clubs.txt", 'w') do |file|
    file << "Put clubs here"
  end
end
```

Ok, so that works. Now let's put in the code to iterate through the clubs

```ruby
task :test do
  puts "writing file"
  File.open("clubs.txt", 'w') do |file|
    Club.all.each do |club|
      file << "The #{club.name}.\n"
    end
  end
end
```
```bash
rake aborted!
NameError: uninitialized constant Club
```
Errored! `uninitialized constant Club`, the rake task cannot read out club class. This is because this task is not being executed from within
our rails app, it's just acting as a plain ol ruby task. This is a good time to illustrate rake dependencies. Rails includes a rake task called `:environment`, which loads and sets up the whole rails projects. So we want to do something like `rake environment test`, so that the environment
is loaded, then the clubs are printed to the file. In short the `test` task
is dependent on the `environment` task. Luckily rake provides a way to specify
a single or even a list of dependencies for a newly defined task:

```ruby
task :test => :environment do
  puts "writing file"
  File.open("clubs.txt", 'w') do |file|
    Club.all.each do |club|
      file << "The #{club.name}.\n"
    end
  end
end
```
