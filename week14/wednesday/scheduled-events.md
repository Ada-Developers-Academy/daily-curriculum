# Scheduled Events

Cron
-----

cron is a unix system utility which run tasks as set intervals. It is used to automate system maintenance tasks, but is also useful for anything you may want to automate. Cron jobs use a crontab (cron table)
to schedule events, it's essentially a table with rows of tasks and columns to times. Something like

| Min| Hour| Day of month (1-31) | Month (1-12) | Day of week (0-6)| Task |
|:--:|:--:|:--:|:--:|:--:|:--:|
|*|1|*|*|*| some_script.sh
|*|*|1|*|*| some_script.sh

Except they actually are typed in a text editor and look like this:

```bash
1 0 * * *  sh some_script.sh
```
Each column is tab-separated.
You can use the command `EDITOR=vim crontab -e` from bash to edit your crontab.

Whenever Gem
-----------

But... Editing crontabs can be a bit obnoxious. Ruby has a gem which helps provide an easy way to generate cron tasks. A gem called [whenever](https://github.com/javan/whenever). You can add whenever to any project by adding it to a `Gemfile`:

```ruby
gem 'whenever', :require => false
```

The require false tells you application to not load this library by default, because most of the time you won't actively be using the gem, you'll only use it to generate the crontab.

In the app run the following to get started.
```bash
wheneverize .
```

That command will create a file `/config/schedule.rb`, within this file
you can define using ruby syntax what the cron tab should contain:

```ruby
every 3.hours do
  runner "MyModel.some_process"
  rake "my:rake:task"
  command "/usr/bin/my_great_command"
end

every 1.day, :at => '4:30 am' do
  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
end

every :hour do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  runner "SomeModel.ladeeda"
end

every :sunday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
  runner "Task.do_something_great"
end

every '0 0 27-31 * *' do
  command "echo 'you can use raw cron syntax too'"
end

# run this task only on servers with the :app role in Capistrano
# see Capistrano roles section below
every :day, :at => '12:20am', :roles => [:app] do
  rake "app_server:task"
end
```

These examples come from the gem [README](https://github.com/javan/whenever). As you can see there are
several ways to define when something should happen. And several tools
to define the tasks. The tasks to use are:

- runner: This will run specific code from within your application.
- rake: This will run a defined rake task.
- command: This is to run a unix command

To have whenever update your crontab use:

```
whenever --update-crontab store
```

Heroku
------

Heroku's system will not maintain a crontab, so they have implemented a system of their own to handle this idea. The [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler#installing-the-add-on).
