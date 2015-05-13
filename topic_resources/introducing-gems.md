# An Introduction to Ruby Gems

Gems (or RubyGems) are what you would other languages would call a library.
They are packaged code that can be shared and distributed. Most gems are
distributed using [RubyGems.org](https://rubygems.org/). A Gem will contain one or more
ruby classes, just like the ones you've been creating this week.
Let's look at a couple gems to get an idea of what would be packaged and why.

- [Rails](https://rubygems.org/gems/rails)
- [Sinatra](https://rubygems.org/gems/sinatra)
- [Colorize](https://rubygems.org/gems/colorize)

## Installing Gems

Installing gems is super easy. You can do it right from the Terminal.

```bash
# gem install <gemname>
gem install money
```

## Requiring Gems

Since gems are external Ruby libraries, they are not included in core Ruby.
So, if we want to use the gem we have to use the `require` statement first

```ruby
require "money"
```

You can do this at the top of any ruby script, app, or in irb.

## Example: Using the `money` gem.

Generally the github page for a gem is the best place to go to get started.
Let's check out the [money gems page](https://github.com/RubyMoney/money).
Under usage we see some common examples of how to use this gem.

```ruby
require 'money'

# 10.00 USD
money = Money.new(1000, "USD")
money.cents     #=> 1000
money.currency  #=> Currency.new("USD")

# Comparisons
Money.new(1000, "USD") == Money.new(1000, "USD")   #=> true
Money.new(1000, "USD") == Money.new(100, "USD")    #=> false
Money.new(1000, "USD") == Money.new(1000, "EUR")   #=> false
Money.new(1000, "USD") != Money.new(1000, "EUR")   #=> true

# Arithmetic
Money.new(1000, "USD") + Money.new(500, "USD") == Money.new(1500, "USD")
Money.new(1000, "USD") - Money.new(200, "USD") == Money.new(800, "USD")
Money.new(1000, "USD") / 5                     == Money.new(200, "USD")
Money.new(1000, "USD") * 5                     == Money.new(5000, "USD")

# Currency conversions
some_code_to_setup_exchange_rates
Money.new(1000, "USD").exchange_to("EUR") == Money.new(some_value, "EUR")
```

Next let's take a quick look at the colorize gem

```bash
gem install colorize
```

Look at the [usage section](https://github.com/fazibear/colorize) of the github page

```ruby
puts "This is blue".colorize(:blue)
puts "This is light blue".colorize(:light_blue)
puts "This is also blue".colorize(:color => :blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
puts "This is blue text on red".blue.on_red
puts "This is red on blue".colorize(:red).on_blue
puts "This is red on blue and underline".colorize(:red).on_blue.underline
puts "This is blue text on red".blue.on_red.blink
puts "This is uncolorized".blue.on_red.uncolorize
```

## Activity: Divide & Conquer Ruby Gems

In groups, research the usage of one of the following gems and create a small example showing at least one of the features of the gem.

- [Money](http://rubymoney.github.io/money/)
- [Awesome Print](https://github.com/michaeldv/awesome_print)
- [lolcat](https://github.com/busyloop/lolcat)
- [pry](https://github.com/pry/pry)
- [Chronic](https://github.com/mojombo/chronic)
- [Geocoder](http://www.rubygeocoder.com/)

