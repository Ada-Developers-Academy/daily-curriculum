class Words
  FILE = File.expand_path(File.dirname(__FILE__) + '/unsorted_words')

  def initialize
    @words = []

    File.open(FILE).each do |line|
      @words << line.chomp
    end
  end

  def remaining_words
    @words.length
  end

  def next_word
    @words.shift
  end
end
