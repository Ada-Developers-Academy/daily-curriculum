### RSPEC
[Rspec](rspec.info)

[RSpec Best Practices](http://betterspecs.org/)

[RSpec core documentation](http://rspec.info/documentation/3.2/rspec-core/)

#### What is RSpec?
RSpec is technically a DSL (Domain-specific language) written in Ruby that is designed to help you test your code. RSpec's syntax reads like English to make it easier to understand and write tests.

#### Setting Up
Install Rspec
``` gem install rspec ```

For each class file that we create, we create one corresponding spec file. We put all spec files in a spec folder so that we can run them all together.

Create the ```chair_spec.rb``` test file.
```ruby
require "spec_helper"

describe Chair do

end
```

Use a ```before``` block to run a specific block of code before every test is run. In this before block example, we will ensure we have an instance of our chair object before we execute these tests.

```ruby
before :each do
    @chair = Chair.new
end
```

Use the describe block to specify actions of a method.
```ruby
describe "#new" do
    it "returns a Chair object" do
        expect(@chair).to be_an_instance_of Chair
    end
end
```
This test simply confirms that we have indeed made a Chair object.

You’ll notice I’ve used the string ```#new``` this is a convention in Ruby to refer to instance methods like this: ```ClassName#methodName``` Since we have the class name in our top-level describe, we’re just putting the method name here.

Also notice the grammar we use within the block here: ```expect(object).to be ``` something.

#### Run Rspec
```
rspec spec
```
This command will execute the tests in the spec folder contained within the current directory.

The tests should fail for ```uninitialized constant Chair``` because we don't have the matching class to our Rspec test yet! According to TDD, we only want to write enough code to fix the problem.

Create the class in the ```Chair.rb``` file
```ruby
class Chair

end
```

Now run the tests again and verify that adding the class definition has forced the test to pass!

_So far we have completed one cycle! "Red, green, refactor"_

Let's do some more examples together!

#### Notes
- An older version of RSpec used ```.should``` methods which was equivalent to the ```expect(object).to``` functionality. We mention it here because if you look up RSpec documentation you may see this old usage.
