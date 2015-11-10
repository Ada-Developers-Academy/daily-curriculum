## Sinatra Practice

The purpose of the Sinatra Practice is to learn and practice the basics of a Sinatra application. The end result should be a single page website hosted on Heroku. The application will also be used as a "blank canvas" to learn and experiment with HTML and CSS.

#### After this lesson you will be able to:

1. Create a basic Sinatra application
2. Define url's that the application will accept (routes)
3. Create an individual html/erb file for our route
4. Add basic HTML/CSS to the viewable page
5. Start the application on a local server
6. View the application in a web browser

### Get Started
We will be creating a simple Sinatra application that serves a single simple page. At any point you are stuck in this walk-through, you can refer to the completed project on [Github](https://github.com/Ada-Developers-Academy/daily-curriculum/sinatra_practice)

### What is Sinatra?
Sinatra is a DSL for quickly creating web applications with Ruby

#### Setup

First we'll install the Sinatra gem

```ruby
gem install sinatra
```

This command will install Sinatra gem into our system wide gems. The gem will now be available to any application on your computer.

Next we'll create a directory to keep the application in:

```bash
mkdir sinatra_practice
cd sinatra_practice
```

Open the entire project from this sinatra_practice directory in your text editor.

#### Gemfile
First we'll create a file called `Gemfile` (no extension, just `Gemfile`) and install the `bundler` gem. In Terminal run:

```bash
touch Gemfile
gem install bundler
```

Open the `Gemfile` and add the following.

```ruby
source 'https://rubygems.org'
gem 'sinatra'
```

In the Terminal run

```bash
bundle install
```

This will install the gems listed within our Gemfile

#### Creating the app
Next, we'll create our application class, create a `my_app.rb` file, from the Terminal:

```bash
touch my_app.rb
```
Open the file in Atom and add the following code:

```ruby
# my_app.rb
require 'sinatra'

class MyApp < Sinatra::Base
  # This is where your code will go
end
```

Note: I've added a comment of `# my_app.rb` just to signify which file the snippet goes into.

Line by line let's look at what we're doing here:

```ruby
require 'sinatra'
```

This line just loads the Sinatra gem into our code. Since Sinatra is not part of standard ruby, we have to explicitly load it into our project.

```ruby
# my_app.rb
class MyApp < Sinatra::Base

end # this just ends our class
```

`class MyApp` is starting to define a new class, just like any other plain ol' ruby class. The `< Sinatra::Base` makes that plain ruby class inherit from the basic Sinatra class. This class defines many methods that we may be using within our application, such as:

- `get`
- `post`
- `set`
- `erb`
- `render`
- `settings`

And many others.

As we just mentioned the get method is defined from `Sinatra::Base`, which are inheriting from, so lets implement that into our code.

```ruby
# my_app.rb
require 'sinatra'

class MyApp < Sinatra::Base

  get "/" do

  end

end
```

We've added the `get` method to our app. This method requires one argument and a block. Here the argument is `"/"`, this is the route. The route is the path that is recognized by our application from the web browser.

That is our app (for now).

#### Starting our app

Next we will create the `config.ru` file, which is the file that will tell our webserver how to run our application:

```bash
touch config.ru
```

Within the config.ru file write the code:

```ruby
# config.ru (run with rackup)
require './my_app'
run MyApp
```

The `require './my_app` line is loading the my_app.rb file. Now we have the `MyApp` class loaded. Note that the `my_app` and `MyApp` relate directly to the file and class the you already created. If you named them something different, you will have to adjust this code to use your names.

The `run MyApp` calls the `run` method on your `MyApp`. `run` is a method we are using from Sinatra, this method starts a web server using the Sinatra app (class) you pass into it.

We run this config.ru file using the `rackup` command from within Terminal:

```bash
rackup
```
You should see something like:

```bash
Thin web server (v1.6.1 codename Death Proof)
Maximum connections set to 1024
Listening on 0.0.0.0:9292, CTRL+C to stop
```
Our server is running the application we just created!

Now if you open a web browser and navigate to "http://localhost:9292" you will see... a blank page. But that is expected because we haven't put any content within our `get` block

#### Serving Something

```ruby
# my_app.rb
class MyApp < Sinatra::Base

  get "/" do
    "Hello World"
  end

end
```
#### Serving HTML

```ruby
# my_app.rb
class MyApp < Sinatra::Base

  get "/" do
    erb :index
  end

end
```

I've added the line `erb :index`, the `erb` method also comes from Sinatra, it requires an argument, here we're giving it the argument of `:index`. This method tells our application to read at file located at `views/index.erb`.

If you restart your server (ctrl + C, then `rackup` again), and load the page again, you will get an error that looks like

```
No such file or directory -
...sinatra_practice/views/index.erb
```

This happens because we haven't made that `index.erb` file yet. We'll create the `views` dir, then the `index.erb`

```bash
mkdir views
touch views/index.erb
```

Again if we load "http://localhost:9292" in our browser, we'll get a blank page. But if we add some HTML to our index.erb it will be served to our browser.

```html
<!-- views/index.erb -->
Hello, the time is currently <%= Time.now %>
```

Now if we reload our page (you don't need to restart the server), we will see this text. And if we reload again we will see that the ruby code `Time.now` is being evaluated on every page load.

Since this is a just a practice application, we don't *need* to put a bunch of cool stuff into it. Feel free to add any content to the index.erb file you'd like though.

Now we have a dummy app to practice HTML/CSS with. Later, we will use this project to add content to.

#### Moar Practice!

- Try to create a route and erb page called "/cute_pictures_of_animals".
- Try to implement some HTML Images of cute animals on the `cute_pictures_of_animals` page.
- Using the sinatra [README](http://www.sinatrarb.com/intro.html#Templates%20with%20%3Ccode%3Eyield%3C/code%3E%20and%20nested%20layouts) try to implement a layout file (described under the `Templates with yield and nested layouts` section). The layout file will be used as a common parent HTML file for all of your individual pages.
