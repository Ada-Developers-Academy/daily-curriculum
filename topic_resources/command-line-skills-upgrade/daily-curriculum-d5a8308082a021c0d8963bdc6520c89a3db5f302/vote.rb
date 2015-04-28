# Create a Vote class. An instance of the Vote class
# should have a question attribute and a results attribute.
#
# The question attribute should be a string that
# is passed in as an argument when the object is created.
#
# The result attribute should be a hash with keys
# of the given answers and value of the number of votes that key has receieved
#
# vote = Vote.new("Who should run for president in 2016?")
# vote.cast("Hillary")
# vote.cast("Ada")
# vote.cast("Ada")
# vote.results # => {"Hillary" => 1, "Ada" => 2}

# Create a vote class
# Add question attr (string) and result attr
# Add initialize with an argument
# Add a `cast` instance method
# Add attr_accessor for attributes

class Vote
  attr_accessor :question, :results

  def initialize(question)
    @question = question
    @results  = {}
  end

  def cast(answer)
    if @results[answer] == nil
      @results[answer] = 1
    else
      @results[answer] += 1
    end
  end

end
