require "./lib/phrase"

describe Phrase do

  it "should count a single word one time" do
    phrase = Phrase.new("word")
    counts = { "word" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should count each word one time" do
    phrase = Phrase.new("one of each")
    counts = { "one" => 1, "of" => 1, "each" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should count multiple occurrences one time for each occurrence" do
    phrase = Phrase.new("one fish two fish red fish blue fish")
    counts = { "one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should reset its counting hash each time it counts words" do
    phrase = Phrase.new("all the kings horses and all the kings men")

    # count the words a second time
    phrase.word_count

    counts = { "all" => 2, "the" => 2, "kings" => 2, "horses" => 1, "and" => 1, "men" => 1 }

    expect(phrase.word_count).to eq counts
  end

  it "should normalize the case of the words" do
    phrase = Phrase.new("go Go GO")
    counts = { "go" => 3 }

    expect(phrase.word_count).to eq counts
  end
end
