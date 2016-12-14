# Hangman

## Breakfast
Create a hangman game that can be played from the Terminal.

The rules according to Wikipedia:

> The word to guess is represented by a row of dashes, giving the number of letters. If the guessing player suggests a letter or number which occurs in the word, the other player writes it in all its correct positions. If the suggested letter or number does not occur in the word, the other player draws one element of the hanged man stick figure as a tally mark. The game is over when:
>
> - The guessing player completes the word, or guesses the whole word correctly
> - The other player completes the diagram:

```
|     _________
|     |/      |
|     |      (_)
|     |      \|/
|     |       |
|     |      / \
|     |
| ____|___ word: _ O _ D O _
```

To get the hang of gameplay, here is an [online version to play](http://www.playhangman.com/PH.asp?g=cats)

- Between each guess, the board should be redrawn to the terminal output (Ascii art!).
- Use classes to contain your game logic. You may be able to implement your solution using just one class, but consider how isolating related functionality into separate classes may increase your code's readability and maintainability (single responsibility principle).
- You should be able to play your game by running it from `ruby` directly, as opposed to starting it in `irb`. We did this with Mastermind, so refer to it for reference.
- You need to allow the user to input a single letter at a time.

## Lunch
- Display the letters that have already been guessed before each player guesses a new letter.
- Use the colorize gem to make each piece of the hangman a different color.
- Handle inappropriate user input. For example, what happens when a user enters an exclamation point.

## Dinner
- Ensure the user is not penalized for guessing the same letter more than once.
- Allow the user to choose their difficulty level: higher levels will have words or phrases with more letters. You determine the specific logic that will determine a low, medium, high level, for example.
- Allow the user to accept a whole word as input. If the word is guessed correctly, the user will win.

### [Rubric](../rubrics/week_2_hangman.md)
