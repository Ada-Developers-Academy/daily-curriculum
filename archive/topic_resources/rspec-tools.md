# Rspec Tools

#### SimpleCov

We've covered [simplecov](https://github.com/colszowka/simplecov) with ruby projects in the past, but it's just as easy to implement into a rails project. In your gemfile add:

    gem 'simplecov', :require => false, :group => :test

Then to tell simple cov to track your files add the following to the very top of the spec_helper.rb

    require 'simplecov'
    SimpleCov.start

The results can be seen in HTML file `coverage/index.html`.

If some files are being seen by simplecov that shouldn't such as any spec file, you can add additional configuration by changing the code at the top of the spec_helper.rb:

    require 'simplecov'
    SimpleCov.start do
      add_filter "/spec/"
    end

More configuration options can be found on the [simplecov github page](https://github.com/colszowka/simplecov)

#### Guard

We have implemented [guard rspec](https://github.com/guard/guard-rspec) in the past as well, here are the steps for installing it within a rails application. Add to the `development` and `test` groups of the `Gemfile`:

    gem "guard-rspec", require: false

Then from the Terminal, run the following command to setup the configuration file (`Guardfile`)

    guard init rspec

Now you should be able to run your specs continuously by running `bundle exec guard`
