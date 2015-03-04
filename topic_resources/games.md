# 2D Graphics With Gosu

[Gosu](http://www.libgosu.org/) is a 2D graphics library that you can
access from from ruby via a gem.

## Installing Gosu

Unfortunately, we need to run Gosu on Ruby 1.9. Thankfully, we have
rvm. To install and use Ruby 1.9:

```
$ rvm install 1.9
$ rvm use 1.9
Using /Users/dean/.rvm/gems/ruby-1.9.3-p545
```

On OS X, we're going to need to install a few support libraries to get Gosu
working:

```
$ brew install libogg libvorbis
$ brew install sdl2 --HEAD
```

Finally, we can just install the gem (Mac and Windows):

```
$ gem install gosu
```

## Test It Out

To see if it worked, paste the following code into a file called gosu_test.rb:

```
require 'rubygems'
require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = 'Hello World!'
  end
end

window = MyWindow.new
window.show
```

If you run this code via ```ruby ./gosu_test.rb```, you should see a
blank black window pop up with "Hello World!" in the header. Cmd-Q or
Alt-F4 to quit out of the app.

## Gosu's Game Loop and Callbacks

Gosu manages the initialization and running of your game's core loop
for you. Its game loop follows a common pattern:

![Game Loop](http://gameprogrammingpatterns.com/images/game-loop-simple.png)

In order to add interaction and update graphics we need to write
custom code in the update and render phases of the loop. In Gosu we do
this by overriding two methods provided by the Gosu::Window class
called ```update()``` and ```draw()```. ```update``` and ```draw```
are sometimes called
"[callbacks](http://en.wikipedia.org/wiki/Callback_(computer_programming))";
they're pieces of code that the game loop expects to be defined and
able to call once per pass through the game loop.

We can define our own behavior by overriding the methods in our
Gosu::Window sub-class. Extending the above example:

```
require 'rubygems'
require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = 'Hello World!'
  end

  def update
    # capture input and update state here
  end

  def draw
    # draw game objects to the screen here
  end
end

window = MyWindow.new
window.show
```

While ```initialize``` is called once when the game is started,
```update``` and ```draw``` are called every time through the game
loop, or once per rendered frame in your game. On a fast computer with
a good graphics card, this should be close to 60 times per second.


