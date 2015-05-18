### RSPEC
[Rspec](rspec.info)

[Additional Tutorial Info](http://code.tutsplus.com/tutorials/ruby-for-newbies-testing-with-rspec--net-21297)

#### What is RSpec?
RSpec is technically a DSL (Domain-specific language) written in Ruby that is designed to help you test your code. RSpec's syntax also reads like English to

#### Setting Up
Install Rspec
``` gem install rspec ```

For each class file that we create, we create one spec file.

Create the ```chair_spec.rb``` test file.
```
require 'spec_helper'

describe Chair do

end
```

Use a ```before``` block to run a specific block of code before every test is run. In this before block example, we will ensure we have an instance of our chair object before we execute these tests.

```
before :each do
    @chair = Chair.new "Spinny", "Yellow", :height
end
```

Use the describe block to specify actions of a method.
```
describe "#new" do
    it "takes three parameters and returns a Chair object" do
        @chair.should be_an_instance_of Chair
    end
end
```
This test simply confirms that we have indeed made a Chair object.

You’ll notice I’ve used the string ```#new``` this is a convention in Ruby to refer to instance methods like this: ```ClassName#methodName``` Since we have the class name in our top-level describe, we’re just putting the method name here.

Also notice the grammar we use within the block here: ```object.should do_something```. Ninety-nine percent of your tests will take this form: you have an object, and you start by calling ```should``` or ```should_not``` on the object.

#### Run Rspec
```rspec spec```
This command will execute the tests in the spec folder from the current directory.

The tests should fail because we don't have the matching class to our Rspec test yet! According to TDD, we only want to write enough code to fix the problem.

Create the class in the ```Chair.rb``` file
```
class Chair

end
```



_So far we have completed one cycle! "Red, green, refactor"_
