## Sinatra Practice
We will be creating a simple Sinatra application that serves a single simple page. This page will be our learning place for HTML and CSS in the next week. At any point you are stuck in this walk-through, you can refer to my completed project on [Github](https://github.com/Ada-Developers-Academy/daily-curriculum/tree/master/week4/friday/sinatra_practice)

#### Setup

First we'll install the Sinatra gem (you probably have it installed already, but it doesn't hurt to run this command again)

    gem install sinatra
    
This command will install Sinatra gem into our system wide gems. The gem will now be available to any application on your computer. 

Next we'll create a directory to keep the application in:

    mkdir sinatra_practice
    cd sinatra_practice
    
Open the entire project in Sublime:
    
    subl .
    
In bash `.` refers to your current directory. 

**Note if your `subl` command doesn't work:** You can also open the directory in Sublime by opening the application and navigating to `File > Open` and selecting the `sinatra_practice` dir from the drop down selector.


#### Gemfile (hand wave)
First we'll create a file called `Gemfile` (no extension, just `Gemfile`) and install the `bundler` gem. In Terminal run:

    touch Gemfile
    gem install bundler
    
And add some stuff to the Gemfile file.

    source 'https://rubygems.org'
    gem 'sinatra'
    
In the Terminal run

    bundle install
    
This will install the gems listed within our Gemfile

Don't worry about the Gemfile, this part is still magic, we'll get into that in another lesson.

#### Creating the app
Next, we'll create our application class, create a `my_app.rb` file, from the Terminal:

    touch my_app.rb
    
Open the file in Sublime and add the following code:

    # my_app.rb
    require 'sinatra'

    class MyApp < Sinatra::Base
      # This is where your code will go
    end
    
Note: I've added a comment of `# my_app.rb` just to signify which file the snippet goes into.

Line by line let's look at what we're doing here:

    require 'sinatra'
    
This line just loads the Sinatra gem into our code. Since Sinatra is not part of standard ruby, we have to explicity load it into our project.

    # my_app.rb
    class MyApp < Sinatra::Base
    
    end # this just ends our class
    
`class MyApp` is starting to define a new class, just like any other plain ol' ruby class. The `< Sinatra::Base` makes that plain ruby class inherit from the basic Sinatra class. This class defines many methods that we may be using within our application, such as:

- `get`
- `post`
- `set`
- `erb`
- `render`
- `settings`

And many others.

As we just mentioned the get method is defined from `Sinatra::Base`, which are inheriting from, so lets implement that into our code.

    # my_app.rb
    require 'sinatra'

    class MyApp < Sinatra::Base

      get "/" do

      end

    end
    
We've added the `get` method to our app. This method requires one argument and a block. Here the argument is `"/"`, this is the route. The route is the path that is recognized by our application from the web browser.

That is our app (for now).

#### Starting our app

Next we will create the `config.ru` file, which is the file that will tell our webserver how to run our application:

    touch config.ru
    
Within the config.ru file write the code:

    # config.ru (run with rackup)
    require './my_app'
    run MyApp
    
The `require './my_app` line is loading the my_app.rb file. Now we have the `MyApp` class loaded. Note that the `my_app` and `MyApp` relate directly to the file and class the you already created. If you named them something different, you will have to adjust this code to use your names.

The `run MyApp` calls the `run` method on your `MyApp`. `run` is a method we are using from Sinatra, this method starts a web server using the Sinatra app (class) you pass into it.

We run this config.ru file using the `rackup` command from within Terminal:

    rackup
    
You should see something like:

    Thin web server (v1.6.1 codename Death Proof)
    Maximum connections set to 1024
    Listening on 0.0.0.0:9292, CTRL+C to stop
    
Our server is running the application we just created!

Now if you open a web browser and navigate to "http://localhost:9292" you will see... a blank page. But that is expected because we haven't put any content within our `get` block

#### Serving HTML

    # my_app.rb
    class MyApp < Sinatra::Base

      get "/" do
        erb :index
      end

    end
    
I've added the line `erb :index`, the `erb` method also comes from Sinatra, it requires an argument, here we're giving it the argument of `:index`. This method tells our application to read at file located at `views/index.erb`.

If you restart your server, and load the page again, you will get an error that looks like

    No such file or directory - 
    ...sinatra_practice/views/index.erb
    
This happens because we haven't made that `index.erb` file yet. We'll create the `views` dir, then the `index.erb`

    mkdir views
    touch views/index.erb
    
Again if we load "http://localhost:9292" in our browser, we'll get a blank page. But if we add some HTML to our index.erb it will be served to our browser.
  
    <!-- index.erb -->
    Hello, the time is currently <%= Time.now %>
    
Now if we reload our page, we will see this text. And if we reload again we will see that the ruby code `Time.now` is being evaluated on every page load.

Since this is a just a practice application, we don't *need* to put a bunch of cool stuff into it. Feel free to add any content to the index.erb file you'd like though.

#### Deploying to Heroku    

Heroku uses git, so first we'll setup git with our project

    git init
    git add .
    git commit -m "initial commit"
    
This is the normal git flow of initializing a dir, adding, and commiting all of the code. 

Heroku is the service that will actually host our application. We will use the [Heroku Toolbelt](https://toolbelt.heroku.com) (a tool we installed on day one). First we'll use a command that will create a repo on Heroku's server for us to push our application into.

    heroku create bookis-sinatra

Use a unique name where I used `bookis-sinatra`. You should see out put that looks similar to:

    Creating bookis-sinatra... done, stack is cedar
    http://bookis-sinatra.herokuapp.com/ | git@heroku.com:bookis-sinatra.git
    Git remote heroku added
    
The `heroku create` command creates the repo on Heroku and also creates the git remote link on our computer.
    
Note: The git remote link is automatically called `heroku`, where in the past we've named this link `origin`.

Now push your app to Heroku:

    git push heroku master
    
You should see a bunch of output for about a minute. Heroku is receiving your application and deploying it. Now you app is available on the internet. Navigate to "http://YOURAPPNAME.herokuapp.com" where YOURAPPNAME is the name you gave to heroku, `bookis-sinatra` in my case, so the full url is `http://bookis-sinatra.herokuapp.com`. TADA!

Now we have a dummy app to practice HTML/CSS with. On monday we will use this project to add content to. 

#### Testing Comprehension (extra credit)

- Try to create a route and erb page called "/cute_pictures_of_animals".
- Try to implement some HTML Images of cute animals on the `cute_pictures_of_animals` page.
- Using the sinatra [README](http://www.sinatrarb.com/intro.html#Templates%20with%20%3Ccode%3Eyield%3C/code%3E%20and%20nested%20layouts) try to implement a layout file (described under the `Templates with yield and nested layouts` section). The layout file will be used as a common parent HTML file for all of your individual pages.
