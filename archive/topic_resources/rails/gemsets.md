# Gems!

[RVM Gemset Basics](https://rvm.io/gemsets/basics)

## Gemset

Do this after forking from master, make sure you're on your own branch.

1.  cd into your 'project-forks' folder
2.  `echo 'ProjectName' > PROJECTFOLDER/.ruby-gemset`
    - ex) `echo 'TaskListRails' > TaskListRails/.ruby-gemset`
3.  `echo '2.2.3' > PROJECTFOLDER/.ruby-version` (Or whatever the latest version of Ruby is)
    - ex) `echo '2.2.3' > TaskListRails/.ruby-version`
4.  cd in to project folder (wrappers happen...)
5.  `rvm gemset list` (yes it's on the gemset we just created)
6.  `gem install bundler`
7.  `gem install rails --no-ri --no-rdoc`
8.  `git add .`
9.  `git commit -m "Created gemset."`
10. `rails new . -T`
11. `git add .`
12. `git commit -m "fresh Rails install"`
13. open and edit `Gemfile` with gems, save!
14. `bundle install --without production`
