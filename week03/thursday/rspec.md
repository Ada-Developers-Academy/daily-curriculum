# Unit Testing
Unit testing is a way to test small units of code. Testing code will allow us to catch errors early on in the development process. It can also help us maintain existing code functionality as we modify or add additional code. Ruby comes with a testing framework called `Test::Unit`. RSpec is a similar method of testing and more prominent in the Rails world.

# RSpec

The assumed file structure for a project using Rspec:

    /lib
      code.rb
    /spec
      /lib
        code_spec.rb
    
RSpec files are generally made up of 2 major elements `describe` blocks and `it` blocks.

`describe` blocks are a way of nesting our tests into logical sections.

    describe "Person" do
      describe "initialization" do
      
      end
    end
    
`it` blocks must be within at least one `describe` block. This is where we actually define our tests.

    describe "Person" do
      it "should have the name assigned to it" do
        # TEST GOES HERE
      end
    end

`describe` and `it` blocks both create human readable comments about the tests we are writing. 

    "Person should have the name assigned to it"
    
Within the `it` block is where we should define a specific test

### FarMar Coverage

    gem install simplecov
    rspec
    open coverage/index.html
