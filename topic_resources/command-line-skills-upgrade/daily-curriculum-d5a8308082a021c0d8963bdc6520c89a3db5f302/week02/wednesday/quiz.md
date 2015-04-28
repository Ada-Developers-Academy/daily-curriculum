What does the following code print?

name = :crank
puts name.inspect()
:crank

Words that are preceded with : are called symbols.  Symbols are similar to strings, but symbols are immutable.
What does the following code print?

puts "unicorn".reverse()
"nrocinu"

reverse() is a method that lets all stings be reversed.
What does the following code print?

puts :unicorn.reverse()
This raises an error because symbols don't have a method called reverse().  Since symbols don't have some of the capabilities of strings, they are more efficient to store in memory.  It is appropriate to use symbols when the additional functionality that strings provide is not used.
What does this code print?

["fat", "bat", "rat"].each { |word| puts word + "-land" }
"fat-land"
"bat-land"
"rat-land"

The each method iterates over every element of the array and executes the code block for every iteration.  The code block in this example is { |word| puts word + "-land" }.  |word| is the block variable and it changes each iteration to the respective word in the array.  This does not all need to make sense now - just get used to the syntax as this pattern is used frequently in Ruby.
What does this code print?

counter = 0
array = ["fat", "bat", "rat"]
while counter < array.length
  puts array[counter] + "-land"
  counter += 1
end
"fat-land"
"bat-land"
"rat-land"

A while loop can be used in place of Ruby's built-in Array methods like each(), but the code is more verbose.  In this example, a counter variable is defined to keep track of how many iterations have been run, so the program know when to exit the loop.
What does the following code print?

array = ["snake", "rat", "cat", "dog"]
array.each { |animal| puts animal if animal[0] == "s"  }
"snake"

This each loop iterates over every element of the array and prints the name of the animal if the name begins with a "s".  It this array, only "snake" beings with an "s", so that is the only animal name that is printed.
What does the following code return?

[:a, :b, :c].include?(:a)
true

[:a, :b, :c] is an array of symbols.  The Array#include? method iterates over the array and checks if the element :a is in the array.  Since the array [:a, :b, :c] includes the element :a, the method returns true.
What does the following code return?

["roof", "top"].include?("bar")
false

The ["roof", "top"] array does not include the word "bar", so the include? method returns false.
What does the following code return?

["Too", "Weird", "To", "Live,", "Too", "Rare", "To", "Die"].join(" ")
"Too Weird To Live, Too Rare To Die"

The join() method converts all the elements of an array to a single string.
What does the following code return?

["where's", "wallace", "at"].join("***")
"where's***wallace***at"

The argument that is passed to the join() method is what shows up between every element of the array that is joined.
What does the following code return?

[2, 4, 6, 8].map { |number| number ** 2 }
[4, 16, 36, 64]

The map() method iterates though every element of an array and returns a new array.  In this example, the new array contains the squared value of the old array.
What does the following code return?

[2, 4, 6, 8].map do |number|
  number ** 2
end
[4, 16, 36, 64]

This is the same as the previous example, but with different syntax.  Code blocks can be delimited with { } or do/end.  Single line code blocks are typically delimited with { } and multiline code blocks are delimited with do/end.
A hash is collection of key/value pairs and is a fundamental data structure in Ruby (arrays are also a fundamental Ruby data structure).  This is an example of a hash that summarizes the Warty Newt.

warty_newt = { "type" => "Amphibian", "diet" => "Carnivore", "life_span" => "25 years" }

Identify the components of the warty_newt hash.
The warty_newt hash has 3 key/value pairs: "type" => "Amphibian", "diet" => "Carnivore", "life_span" => "25 years"

The first key/value pair ("type" => "Amphibian") has a key of "type" and a value of "Amphibian".  The key is alway on the left and the value is always on the right.

A "hash rocket" (=>) is used to separate the key and the value and the key/value pairs are separates from each other with commas.
What does the following code return?

warty_newt = { "type" => "Amphibian", "diet" => "Carnivore", "life_span" => "25 years" }
warty_newt["type"]
"Amphibian"

The warty_newt["type"] tells Ruby to return the value that corresponds to the key "type".
What does the following code return?

warty_newt = { "type" => "Amphibian", "diet" => "Carnivore", "life_span" => "25 years" }
warty_newt.fetch("type")
"Amphibian"

fetch() is a hash method that also returns the value that corresponds to the specified key.
What does the following code print?

warty_newt = { "type" => "Amphibian", "diet" => "Carnivore", "life_span" => "25 years" }
warty_newt["weight"] = "0.3 ounces"
puts warty_newt
{"type"=>"Amphibian", "diet"=>"Carnivore", "life_span"=>"25 years", "weight"=>"0.3 ounces"}

Notice that the the following key/value pair has been added to the end of the warty_newt hash: "weight"=>"0.3 ounces"
Create a hash for a snowy_owl, a bird that is a carnivore and has a life span of 10 years.
snowy_owl = { "type"=>"Bird", "diet"=>"Carnivore", "life_span"=>"10 years" }
What does the following code return?

snowy_owl = { "type"=>"Bird", "type" => "Owl", "diet"=>"Carnivore", "life_span"=>"10 years" }
puts snowy_owl
{"type"=>"Owl", "diet"=>"Carnivore", "life_span"=>"10 years"}

Notice that the second key/value pair with the key "type" is included.  Every key in a hash must be unique.
What does the following code return?

snowy_owl = { "type"=>"Bird", "diet"=>"Carnivore", "life_span"=>"10 years" }
snowy_owl.keys()
["type", "diet", "life_span"]
The keys() method for hashes returns an array of all the keys in the hash.
What does the following code return?

snowy_owl = { "type"=>"Bird", "diet"=>"Carnivore", "life_span"=>"10 years" }
snowy_owl.values()
["Bird", "Carnivore", "10 years"]
The values() method for hashes returns an array of all the values in the hash.
What does the following code return?

snowy_owl.select {|key, value| key if key == "type"}
{"type"=>"Bird"}

The select() method is used to find the key/value pair with the key equal to "type".
Make a hash that is similar to the snowy_owl hash, but make all of the keys symbols. 

snowy_owl = { "type"=>"Bird", "diet"=>"Carnivore", "life_span"=>"10 years" }
{ :type => "Bird", :diet => "Carnivore", :life_span => "10 years" }

It is common to use symbols as hash keys in Ruby.
result = []
first_names = ["Hamburglar", "Grimace", "Ronald"]
last_name = "McDonald"

Iterate through first_names and populate result with the first_names and last name (result should be ["Hamburglar McDonald", "Grimace McDonald", "Ronald McDonald"] after the iteration).
first_names.each { |first_name| result.push(first_name + " " + last_name) }
personality_types = ["bad", "good", "great"]

Iterate through personality_types and construct this array: ["bad person", "good person", "great person"]
personality_types.map { |type| type + " person" }
Convert ["waters", "too", "polluted", "with", "germs"] to "waters too polluted with germs".
["waters", "too", "polluted", "with", "germs"].join(" ")
lebron = {:sport => "basketball", :birthplace => "Akron"}

Return the value corresponding to the key :sport in the lebron hash.
lebron[:sport]
lebron = {:sport => "basketball", :birthplace => "Akron"}

Add the :high_school key to the lebron hash with the value "St. Vincent-St. Mary High School".
lebron[:high_school] = "St. Vincent-St. Mary High School"
lebron = {:sport=>"basketball", :birthplace=>"Akron", :high_school=>"St. Vincent-St. Mary High School"}

Return an array of all the keys in the lebron hash.
lebron.keys()
lebron = {:sport=>"basketball", :birthplace=>"Akron", :high_school=>"St. Vincent-St. Mary High School"}

Return an array of all the values in the lebron hash.