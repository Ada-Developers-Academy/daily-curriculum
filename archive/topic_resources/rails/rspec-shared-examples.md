# RSpec Shared Examples

Creating RSpec tests for objects that are similar or behave similarly can be extremely valuable. RSpec has the concept of [Shared Examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples) which enable you to create tests that are more reusable across similar object types.

Shared examples are created using specific RSpec matchers that will match the type of object you wish to test with the type of generic tests you've created.

Let's see an example:  
`spec/models/movie_spec.rb`
```ruby
RSpec.describe Movie, type: :model do
  it_behaves_like "a medium"

  # Any remaining movie-specific tests
end
```
`spec/support/medium_spec.rb`
```ruby
RSpec.shared_examples "a medium" do
  # Any shared 'medium' tests
end
```

**Important Note**: the string in this case is not just a "regular" string, it is the piece of data that binds the model test to the shared example.

In the shared example, it is often necessary to know _which specific_ item you are testing.

You can use the `described_class` variable to gain access to the class that is currently being enacted on the shared example. In the example above, the `described_class` variable would refer to `Movie`.

`spec/support/medium_spec.rb`
```ruby
RSpec.shared_examples "a medium" do
  describe "model validations" do
    it "requires a title" do
      medium = described_class.new

      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :title
    end

end
```

You can also nest `let` statements in the spec to pass different sets of data to the shared example. This comes in handy especially for controller testing if you need a different set of `params` for different model types.  

`spec/models/movie_controller_spec.rb`
```ruby
RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:params) do
      {
        movie: {
          title: "a title",
          director: "a director",
          description: "a description"
        }
      }
    end # Ends let
  end # Ends it_behaves_like
end # End describe
```

After this `let` statement is created, the `params` variable can then be used in the shared spec without any additional effort to make it dynamic across different types of models.
