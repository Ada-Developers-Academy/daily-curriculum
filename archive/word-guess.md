## Word-Guess Game

Create a game which will allow the user to guess a word and get ASCII-art as feedback on their guesses.

The Rules:
The word to guess is represented by a row of dashes, giving the number of letters. If the guess is a letter or number which occurs in the word, the word should be updated in all of the correct positions. If the suggested letter or number does not occur in the word, the game should draw or remove one element of the visual representation as a tally mark. The game is over when:
  - The player completes the word, or guesses the whole word correctly
  - The diagram representing the tally marks is complete

For example:
```
(@)(@)(@)  
  ,\,\,|,/,/,
     _\|/_
    |_____|
     |   |
     |___|

word: _ O _ D O _
```

## Baseline
- Determine what type of ASCII art your team would like to utilize - be creative!
- Think through how you think you should structure your code. Your code should utilize class(es) and methods to keep functionality contained.
- Create a program that will accept one user guess input and print it out in the terminal.

## Primary Requirements
### Game play
- The user should be able to input a single letter at a time.
- Between each guess, the board should be redrawn to the terminal output (Ascii art!).
- Display the letters that have already been guessed before each player guesses a new letter.

### Technical
- You should be able to play your game by running it using `ruby` from the terminal.
- Use classes to contain your game logic. You may be able to implement your solution using just one class, but consider how isolating related functionality into separate classes may increase your code's readability and maintainability (single responsibility principle).

## Optional Requirements
- Use the colorize gem to make pieces of the ASCII art a different colors.
- Handle inappropriate user input. For example, what happens when a user enters an exclamation point.
- Ensure the user is not penalized for guessing the same letter more than once.
- Allow the user to choose their difficulty level: higher levels will have words or phrases with more letters. You determine the specific logic that will determine a low, medium, high level.
- Allow the program to accept the whole word as input from the user. If the word is guessed correctly, the user will win. Otherwise, it will be treated as another guess.
