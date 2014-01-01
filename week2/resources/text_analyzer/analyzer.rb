#analyzer.rb -- Text Analyzer


stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines      = File.readlines(ARGV[0])
line_count = lines.size
text       = lines.join

#count the characters
character_count          = text.length
character_count_nospaces = text.gsub(/\s+/, '').length

#count the words, sentences, paragraphs
word_count      = text.split.length
sentence_count  = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Make a list of words in the test that aren't stop words, count them, and work
#   out the percentage of non-stop words against all words

all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#summarize the text by cherry picking some choice sentences
sentences =  text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third =  sentences_sorted.length / 3
ideal_sentences =  sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/}

puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"

