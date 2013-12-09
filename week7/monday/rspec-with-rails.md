## Rspec with Rails

#### In this lesson we will learn:

- Creating a Rails app without test unit.
- Setting up rspec with Rails
- Testing models
- Adding the [Guard](https://github.com/guard/guard-rspec) gem
- Testing controllers

#### Rails new

First we will create a new rails app to implement rspec into. But, since we'll be using rspec, I want to leave out Test::Unit so it doesn't clutter up my app.

    rails new twitter_ripoff -T
    
The `-T` is the flat to leave out Test::Unit

#### Rspec setup

Next we'll add the rspec gem to our application. In the `Gemfile`

    group :development, :test do
      gem 'rspec-rails'
    end
    
Install the gems within our `Gemfile`

    bundle install
    
Now that the `rspec-rails` gem is installed we can run the one-time rspec installer for our project

    rails generate rspec:install
    
This command creates the necassary directories and files to run our specs. The most notable is `spec/spec_helper.rb`, this file is where all of our testing setup is done. The rpsec install command added pretty much everything we need to the file.

Now rspec is ready, let's create some code to test.

#### Testing models

First create a model.

    rails g model post body:text user_id:integer
    
We can see this command created three things:

    invoke  active_record
    create  db/migrate/20131209161227_create_posts.rb
    create  app/models/post.rb
    invoke  rspec
    create  spec/models/post_spec.rb
    
First a migration to setup our database, next the class our logic will go in `post.rb`, and finally a `post_spec.rb` file which is where we will write tests for this model. Let's run our migrations

    rake db:migrate
    
In the `spec/models/post_spec.rb` we can see that some of the structure for writing rspec tests already exists. We have a `pending` spec, this syntax can be useful for keeping track of upcoming tasks. But we don't need it, so replace that line with a new test:

    describe "validations" do
      it "must have a body" do
        expect(Post.new(body: nil)).to_not be_valid
      end
    end
    
We have our first spec, let's run it.

    rake
    
We get a failure (that's good), let's fix it in  `app/models/post.rb`:

    class Post < ActiveRecord::Base
      validates :body, presence: true
    end
    
Then run it again

    rake
    
It passes, and let's add a few more tests to `spec/models/post_spec.rb`

    describe "validations" do
      it "must have a body" do
        expect(Post.new(body: nil)).to_not be_valid
      end

      it "can't have 141 char body" do
        expect(Post.new(body: "a" * 141)).to be_invalid
      end

      it "can have 140 char body" do
        expect(Post.new(body: "a" * 140)).to be_valid
      end
    end

    it "counts it's characteres" do
      expect(Post.new(body: "a" * 122).character_count).to eq 122
    end
    
Run `rake`, you should have 2 failing tests. Let's fix them in `post.rb`:

    validates :body, presence: true, length: { maximum: 140 }

    def character_count
      body.length
    end
    
Run `rake`, and now they pass!

#### Install `guard-rspec`

Guard Rspec will automatically and intelligently run your specs when files are modified. Add the gem to your `:development` group in your `Gemfile`

    gem 'guard-rspec', require: false
    
Run `bundle install` to install the gem. Then run the gems installer:

    guard init rspec
    
This command create the `Guardfile` file. This file tells guard when to run which specs, the syntax isn't very important right now, but let's take out one line to avoid some errors in the future, remove line 14:

    watch('config/routes.rb')           { "spec/routing" }
    
Now we're ready to use guard, from the Terminal run:

    guard
    
This will start a process that 'watches' our files, when any of them are saved, guard runs the specs associated with that file. Let's try it. Go and add a line break to `app/models/post.rb`. Look back at your terminal (give it a second), we can watch our `spec/models/post_spec.rb` specs run.

#### Controller specs

Open a new tab in Terminal (Command T), and create a controller:

    rails g controller posts
    
This command creates quite a few files, the ones we are going to focus on are the actual controller and it's associated spec file:

    app/controllers/posts_controller.rb
    spec/controllers/posts_controller_spec.rb
  
Let's open `spec/controllers/posts_controller_spec.rb` and write a controller spec.

    describe PostsController do
      describe "GET 'index'" do

        it "is successful" do
          get :index
          response.should be_successful
        end

      end
    end

Guard should have picked up this change, so just look back at the other tab in Terminal and we should see a failing spec.

    Failure/Error: get :index
      ActionController::UrlGenerationError:
        No route matches {:action=>"index", :controller=>"posts"}
        
`No route matches` tells me this is a problem with our `routes.rb` file. Lets add the needed code:

    get "/posts" => "posts#index"
    
Since our routes file is not part of the `PostsController`, we may need to manually run our specs to see the result, we can do that be going to the Guard tab in Terminal and just hitting the `return` key. Now the error we get is:

    Failure/Error: get :index
      AbstractController::ActionNotFound:
        The action 'index' could not be found for PostsController
        
Next create an `index` action in our `PostsController`

    class PostsController < ApplicationController

      def index

      end

    end

Next our error is `Missing template posts/index`, let's create the template (or view).

    touch app/views/posts/index.html.erb
    
It passes! 

Let's look at the syntax of our controller spec.

          get :index 
          # => This attempts to make an HTTP request with the method `get` to the `index` action
          
          response.should be_successful 
          # => response is typically the object we want to test in controller specs
          
Rails specs have a lot of extra syntax from regular rspec. See the [rspec cheat sheet](http://cheat.errtheblog.com/s/rspec_shoulda) to learn about more the matchers.
    