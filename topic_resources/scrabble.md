# Scrabble

Use TDD to create classes that would be used to build a scrabble game (don't actually build a interactive game (yet))

|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

## Breakfast

Create a `Scrabble` class with a minimum of 8 specs. The class should have the following class methods:

- `self.score(word)`: returns the total score value for the given word. The word is input as a string (case insensitive)
- `self.highest_score_from(array_of_words)`: returns the word in the array with the highest score.
    - Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
    - Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    - If the there are multiple words that are the same score and same length, pick the first one in supplied list

## Lunch

Create a `Player` class with a minimum of 11 specs. The class should have the following class and instance methods:

- `self.new(name)`: creates a new instance with the instance variable `name` assigned
- `#name`: returns the `@name` instance variable
- `#plays`: returns an Array of the words played by the player
- `#play(word)`: Adds the input word to the `plays` Array
    - Returns false if player has already won
- `#total_score`: Sums up and returns the score of the players words
- `#won?`: If the player has over 100 points, returns `true`, otherwise returns 'false'
- `#highest_scoring_word`: Returns the highest scoring word the user has played.
- `#highest_word_score`: Returns the `highest_scoring_word` score.


## Dinner

Create a `TileBag` class with a minimum of 5 specs. It should have the following class and instance methods:

- `self.new` creates an instance with a collection of default tiles
- `#draw_tiles(n)` returns n number of random tiles, removes the tiles from the default set.
- `#tiles_remaining` returns the number of tiles remaining in the bag

Create specs for (minimum 2) and add to the `Player` class the following instance methods:

- `#tiles` a collection of letters that the player can play (max 7)
- `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag

Beginning Tile Quantities:
  - A: 9
  - B: 2
  - C: 2
  - D: 4
  - E: 12
  - F: 2
  - G: 3
  - H: 2
  - I: 9
  - J: 1
  - K: 1
  - L: 4
  - M: 2
  - N: 6
  - O: 8
  - P: 2
  - Q: 1
  - R: 6
  - S: 4
  - T: 6
  - U: 4
  - V: 2
  - W: 2
  - X: 1
  - Y: 2
  - Z: 1

## Dessert

- Create a `Dictionary` class that includes a method for searching a list of words to determine if a given word is a valid word.
- Create a `Board` class that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction.
- Include a minimum of 20 specs between the `Dictionary` and `Board` classes.
