### RSPEC
[Rspec](rspec.info)

[RSpec Best Practices](http://betterspecs.org/)

[RSpec core documentation](http://rspec.info/documentation/3.2/rspec-core/)

#### What is RSpec?
RSpec is technically a DSL (Domain-specific language) written in Ruby that is designed to help you test your code. RSpec's syntax reads like English to make it easier to understand and write tests.

#### Setting Up
Install Rspec
``` gem install rspec ```

For each class file that we create, we create one corresponding spec file. We put all spec files in a `spec` folder so that we can run them all together.

Create the `spec/intro_spec.rb` file.
```ruby
describe "RSpec Intro" do
end
```

#### Run Rspec
```
rspec spec
```
This command will execute the tests in the spec folder contained within the current directory.


And run the command `rspec spec`. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/b8a762af7b6fe28639395d16990e22362d2b17d5).


Use a `before` block to run a specific block of code before every test is run. In this before block example, we print some text to the screen, however in general we will not use puts anywhere within our specs.

```ruby
before :each do
  puts "This happens first!"
end
```

Run the `rspec spec` command again. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/f558c6805b6411b901e77521f14d7eff6451e173).

### Red, Green, Refactor

#### Red
Use the `describe` block to specify particular functionality within the broader specification covered by the outer `describe` block.

```ruby
describe "basic spec" do
  it "prints something to the screen" do
    expect(puts("something")).to be_truthy
  end
end
```

Run the `rspec spec` command again. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/5428145a357056b74a6cb1b3660208c83b696958).

The output from the `rspec` command shows that we have a test failure in our specification -- that is the `F` on the third line of our output. Normally this means that we will need to improve our code to actually fulfill the expectations of the spec, but in this case it means we've written the spec incorrectly.

#### Green
To be exact, we're expecting the `puts` method call to return a "truthy" value -- that is, something which will pass an `if` condition, rather than execute the `else` block. However `puts` returns `nil`, which is considered "falsey". We can fix our test like so:

```ruby
it "prints something to the screen" do
  expect(puts("something")).to be_nil
end
```

Run the `rspec spec` command again. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/cd373bc69ce2c7b37ed7f9b15d6d01774e0b554b).

We now have a passing test (shown by RSpec as the `.` on the third line). Yaaay!

#### Refactor
Nothing to refactor yet! Our code is pretty clean already.


### Real-World Example
Lets create a new spec file for a Chair class. As per our convention for RSpec files, we will create this file as `spec/chair_spec.rb`. It should include a single test:

```ruby
describe Chair do
  before :each do
    @chair = Chair.new
  end
  
  describe "#new" do
    it "returns a Chair object" do
      expect(@chair).to be_an_instance_of Chair
    end
  end
end
```

This test simply confirms that we have indeed made a Chair object.

You’ll notice I’ve used the string `#new` this is a convention in Ruby to refer to instance methods like this: `ClassName#methodName` Since we have the class name in our top-level describe, we’re just putting the method name here.

Also notice the grammar we use within the block here: `expect(object).to be ` something.

Run the `rspec spec` command again. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/233db92ff4c19f540b95c0c1e6b7d1f5d01650d1).

Once again our `rspec` command is failing. This time we don't even see the output from our intro specs. The lack of a `Chair` class definition is causing RSpec to fail completely. Let's fix that now.

Create a new file `chair.rb` (not in the `spec` folder):

```ruby
class Chair

end
```

and make sure to `require` it in the appropriate spec file:

```ruby
require './chair'
```

Finally, run the `rspec spec` command again. File contents and output should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/68f8f9a63667ea71fd64934f76abc47a478ad9dd).

Our tests pass again. Another complete red-green-refactor cycle! However, we're seeing some output from `rspec` that is slightly different from what we had before... In particular the first line (with `This happens first!`) now begins with a period.

#### Cleaning up our specs
As we saw before, `rspec` outputs a period to the screen for each test that passes successfully. Because we've now fixed the test in our Chair spec file, it's outputting a period to the screen. Then it runs our Intro spec file, which prints some text to the screen, and finally it outputs another period to indicate the Intro spec's test passed.

However, this is somewhat messy. The Intro spec's output is getting in the way of RSpec telling us whether or not our test passed. We should remove the `spec/intro_spec.rb` file completely, and check the output again. Your file contents and output from RSpec should match [this gist](https://gist.github.com/Hamled/f5d81945c9ddd1196ed5/dde7e2f0bab4a1bd77e96cfb3a573622e3b2b5e7).


#### Build-out the Chair example
Let's create some more specs describing what our Chair class should do, and then write the code that implements it.

#### Notes
- An older version of RSpec used `.should` methods which was equivalent to the `expect(object).to` functionality. We mention it here because if you look up RSpec documentation you may see this old usage.
