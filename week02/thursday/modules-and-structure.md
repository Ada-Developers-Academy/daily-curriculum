Creating and publishing your own gem is simple thanks to the tools baked right into RubyGems. Let’s make a simple “hello world” gem, and feel free to play along at home! The code for the gem we’re going to make here is up on GitHub.

Your first gem ————–

I started with just one Ruby file for my hola gem, and the gemspec. You’ll need a new name for yours (maybe hola_yourusername) to publish it. Check the Patterns guide for basic recommendations to follow when naming a gem.

% tree
.
├── hola.gemspec
└── lib
    └── hola.rb
Code for your package is placed within the lib directory. The convention is to have one Ruby file with the same name as your gem, since that gets loaded when require 'hola' is run. That one file is in charge of setting up your gem’s code and API.

The code inside of lib/hola.rb is pretty bare bones. It just makes sure that you can see some output from the gem:

% cat lib/hola.rb
class Hola
  def self.hi
    puts "Hello world!"
  end
end
The gemspec defines what’s in the gem, who made it, and the version of the gem. It’s also your interface to RubyGems.org. All of the information you see on a gem page (like jekyll’s) comes from the gemspec.

% cat hola.gemspec
Gem::Specification.new do |s|
  s.name        = 'hola'
  s.version     = '0.0.0'
  s.date        = '2010-04-28'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Nick Quaranto"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/hola.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
The description member can be much longer than you see in this example. If it matches /^== [A-Z]/ then the description will be run through RDoc’s markup formatter for display on the RubyGems web site. Be aware though that other consumers of the data might not understand this markup.

Look familiar? The gemspec is also Ruby, so you can wrap scripts to generate the file names and bump the version number. There are lots of fields the gemspec can contain. To see them all check out the full reference.

After you have created a gemspec, you can build a gem from it. Then you can install the generated gem locally to test it out.

% gem build hola.gemspec
Successfully built RubyGem
Name: hola
Version: 0.0.0
File: hola-0.0.0.gem

% gem install ./hola-0.0.0.gem
Successfully installed hola-0.0.0
1 gem installed
Of course, the smoke test isn’t over yet: the final step is to require the gem and use it:

% irb
>> require 'hola'
=> true
>> Hola.hi
Hello world!
If you’re using an earlier Ruby than 1.9.2, you need to start the session with irb -rubygems or require the rubygems library after you launch irb.

Now you can share hola with the rest of the Ruby community. Publishing your gem out to RubyGems.org only takes one command, provided that you have an account on the site. To setup your computer with your RubyGems account:

$ curl -u qrush https://rubygems.org/api/v1/api_key.yaml >
~/.gem/credentials; chmod 0600 ~/.gem/credentials

Enter host password for user 'qrush':
If you’re having problems with curl, OpenSSL, or certificates, you might want to simply try entering the above URL in your browser’s address bar. Your browser will ask you to login to RubyGems.org. Enter your username and password. Your browser will now try to download the file api_key.yaml. Save it in ~/.gem and call it ‘credentials’

Once this has been setup, you can push out the gem:

% gem push hola-0.0.0.gem
Pushing gem to RubyGems.org...
Successfully registered gem: hola (0.0.0)
In just a short time (usually less than a minute), your gem will be available for installation by anyone. You can see it on the RubyGems.org site or grab it from any computer with RubyGems installed:

% gem list -r hola

*** REMOTE GEMS ***

hola (0.0.0)

% gem install hola
Successfully installed hola-0.0.0
1 gem installed
It’s really that easy to share code with Ruby and RubyGems.

Requiring more files ——————–

Having everything in one file doesn’t scale well. Let’s add some more code to this gem.

% cat lib/hola.rb
class Hola
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

class Hola::Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "spanish"
      "hola mundo"
    else
      "hello world"
    end
  end
end
This file is getting pretty crowded. Let’s break out the Translator into a separate file. As mentioned before, the gem’s root file is in charge of loading code for the gem. The other files for a gem are usually placed in a directory of the same name of the gem inside of lib. We can split this gem out like so:

% tree
.
├── hola.gemspec
└── lib
    ├── hola
    │   └── translator.rb
    └── hola.rb
The Translator is now in lib/hola, which can easily be picked up with a require statement from lib/hola.rb. The code for the Translator did not change much:

% cat lib/hola/translator.rb
class Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "spanish"
      "hola mundo"
    else
      "hello world"
    end
  end
end
But now the hola.rb file has some code to load the Translator:

% cat lib/hola.rb
class Hola
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

require 'hola/translator'
Gotcha: For newly created folder/file, do not forget to add one entry in hola.gemspec file, as shown-

% cat hola.gemspec
Gem::Specification.new do |s|
...
s.files       = ["lib/hola.rb", "lib/hola/translator.rb"]
...
end
without the above change, new folder would not be included into the installed gem.

Let’s try this out. First, fire up irb:

% irb -Ilib -rhola
irb(main):001:0> Hola.hi("english")
=> "hello world"
irb(main):002:0> Hola.hi("spanish")
=> "hola mundo"
We need to use a strange command line flag here: -Ilib. Usually RubyGems includes the lib directory for you, so end users don’t need to worry about configuring their load paths. However, if you’re running the code outside of RubyGems, you have to configure things yourself. It’s possible to manipulate the $LOAD_PATH from within the code itself, but that’s considered an anti-pattern in most cases. There are many more anti-patterns (and good patterns!) for gems, explained in this guide.

If you’ve added more files to your gem, make sure to remember to add them to your gemspec’s files array before publishing a new gem! For this reason (among others), many developers automate this with Hoe, Jeweler, Rake, Bundler, or just a dynamic gemspec .

Adding more directories with more code from here is pretty much the same process. Split your Ruby files up when it makes sense! Making a sane order for your project will help you and your future maintainers from headaches down the line.

Adding an executable ——————–

In addition to providing libraries of Ruby code, gems can also expose one or many executable files to your shell’s PATH. Probably the best known example of this is rake. Another very useful one is prettify_json.rb, included with the JSON gem, which formats JSON in a readable manner (and is included with Ruby 1.9). Here’s an example:

% curl -s http://jsonip.com/ | \
  prettify_json.rb
{
  "ip": "24.60.248.134"
}
Adding an executable to a gem is a simple process. You just need to place the file in your gem’s bin directory, and then add it to the list of executables in the gemspec. Let’s add one for the Hola gem. First create the file and make it executable:

% mkdir bin
% touch bin/hola
% chmod a+x bin/hola
The executable file itself just needs a shebang in order to figure out what program to run it with. Here’s what Hola’s executable looks like:

% cat bin/hola
#!/usr/bin/env ruby

require 'hola'
puts Hola.hi(ARGV[0])
All it’s doing is loading up the gem, and passing the first command line argument as the language to say hello with. Here’s an example of running it:

% ruby -Ilib ./bin/hola
hello world

% ruby -Ilib ./bin/hola spanish
hola mundo
Finally, to get Hola’s executable included when you push the gem, you’ll need to add it in the gemspec.

% head -4 hola.gemspec
Gem::Specification.new do |s|
  s.name        = 'hola'
  s.version     = '0.0.1'
  s.executables << 'hola'
Push up that new gem, and you’ll have your own command line utility published! You can add more executables as well in the bin directory if you need to, there’s an executables array field on the gemspec.
