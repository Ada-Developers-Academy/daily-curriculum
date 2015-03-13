# Setting up Rails

PostgreSQL
----------
PostgreSQL (postgres) is a relational database, it's primary use is
to store data for future retrieval. Postgres is open source and growing quickly,
it is known for it's extensive support of many data types.

Postgres is software that runs in the background (database server), rails includes
a library (`ActiveRecord`) combined with the PostgreSQL ruby gem (`pg`) which allows
for the application to easily make a connection to the database and a ruby DSL
for executing SQL commands.

Installation

We'll use Homebrew to install Postgres. Start by updating Homebrew and running the
command to install Postgres

```bash
brew update
# ...
brew install postgres
```

Next we'll tell the postgres server to automatically start when the computer starts,
this way you'll never need to start the server in the future.

```bash
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Next we'll make the Postgres we just installed usable by your system.

```bash
sudo atom /etc/paths
password: # enter your password (it won't show as you type)
```

The file will look like

```
/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/bin
```

Move the line `/usr/local/bin` to the top of the file, it should now look like:

```
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
```

Save and close the file.

Next restart your computer!

After the restart open the Terminal and type:

```
which psql
```

You should see `/usr/local/bin/psql`

Next we'll create a default database with your username
```
createdb `whoami`
# be sure to use backticks (below esc) around whoami
```

Everything should be installed and working now. To check enter the postgres terminal:

```
psql
\q # this quits the postgres terminal
```


Getting Started
--------------
Let's start by creating a test Rails application to use as we cover the basics.

```
rails new rails-blog -T -d postgresql
cd rails-blog
```

File Structure
--------------

The file structure within rails can be very daunting. Over time you will get accustomed to all of the
directories and files. Let's take a look at the basic structure.
```
app/
  assets/
    stylesheets/
    javascripts/
    images/
  controllers/
  helpers/
  mailers/
  models/
  views/
bin/
  (hand wave)
config/
  environments/
  initializers/
  locales/
  application.rb
  boot.rb
  database.yml
  environment.rb
  routes.rb
  secrets.yml
db/
  migrate/
    (migration files)
  seeds.rb
lib/
  (hand wave)
log/
  development.log
public/
  404.html
  422.html
  500.html
  favicon.ico
  robots.txt
tmp/
  (hand wave)
vendor/
  (hand wave)
.gitignore
config.ru
Gemfile
Gemfile.lock
Rakefile
README.rdoc
```

I've left out the contents of directories that we want to ignore for now. Let's look
at the most important and frequently used directories and files:

**app**

The app directory is where the majority of the code you write will go. Each directory within
app is a different major portion of the application.

**app/assets**
This is the directory where all of your public assets will live. Any stylesheets,
javascript, or image files will go within their specified sub-directory.

There is already a `application.js` and `application.css` file within each of the respective directories.
These two files are doing a lot of magic, although they only have what appears to be comments do not delete the contents of them.

**app/controllers**

This is where Rails controller files go. Each controller is similar to the single file
that makes up a sinatra app. Within the file will be the definitions for and response logic for the HTTP request.
Any custom controller will inherit from `ApplicationController` which is also within this directory.
Since inheritance is used, any method or action defined within `ApplicationController` will be available to use by
any of the inherited children.

**app/models**

This is where any database backed classes will go. In rails the majority of the ruby classes we
create will have a database attached to them.

**app/views**

The views directory is very similar to the sinatra views directory. We can create view files
for a controller action to render. The view files will be nested within a sub-directory
which will correspond to the controller name. For example a file rendered from the `PostsController`
would be in the `app/views/posts` directory.

In Sinatra our views had a file extension of `.erb`, Rails is similar except the `html` is also in the filename, like
`index.html.erb`.

**config/application.rb**
This is where any application wide configuration goes.

**config/database.yml**

This file is where the configuration for your database connection goes. If the `rails new` command has the correct arguments, very little in this file will need to be changed.

**config/routes.rb**

This file is the most frequently edited file outside of the `app` directory.
This file contains all of the HTTP route definitions. Similar to the route handler lines (not the whole block) in Sinatra.

**db/migrate.***

Files will be generated automatically as you create modification to the database.
Each file is basically an instruction on how to create the database step by step.
