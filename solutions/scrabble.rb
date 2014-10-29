# |A, E, I, O, U, L, N, R, S, T  |   1  |
# |D, G                          |   2  |
# |B, C, M, P                    |   3  |
# |F, H, V, W, Y                 |   4  |
# |K                             |   5  |
# |J, X                          |   8  |
# |Q, Z                          |   10 |


class Scrabble
  SCORES = {:a => 1, :e => 1,
          :i => 1, :o => 1,
          :u => 1, :l => 1,
          :n => 1, :r => 1,
          :s => 1, :t => 1,
          :d => 2, :g => 2,
          :b => 3, :c => 3,
          :m => 3, :p => 3,
          :v => 4, :h => 4,
          :w => 4, :y => 4,
          :f => 4, :k => 5,
          :j => 8, :x => 8,
          :q => 10,:z => 10}

  def self.score(word)
    score = 0
    word.downcase.chars.each do |letter|
      score += SCORES[letter.to_sym]
    end
    return score
  end

  # `self.highest_score_from(array_of_words)`
  # returns the word in
  # the array with the highest score.

  # Note that it’s better to use fewer tiles, so if the top
  # score is tied between multiple words, pick the one with the fewest letters.

  # ['cat', 'giraffe']

  def self.highest_score_from(array_of_words)
    # create a variable for the highest_word=nil
    # iterate over each word in the array
      # get the score for each one
      # if word greater than highest_word
        # highest_word = word
    # if highest scores are tied
      # use the one with shortest length
    highest_word = ""
    array_of_words.each do |word|
      highest_word = higher_word(word, highest_word)
    end
    highest_word
  end

  def self.higher_word(word, new_word)
    word_score = self.score(word)
    high_word_score = self.score(new_word)

    if word_score > high_word_score
      return word
    elsif word_score == high_word_score
      if word.length < new_word.length
        return word
      end
    end
    new_word
  end

end

puts Scrabble.highest_score_from(['cat', 'zzd', 'zzai', "dog"]).inspect
