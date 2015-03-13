# Hangman

Create a hangman game that can be played from the Terminal.
The rules according to Wikipedia:

> The word to guess is represented by a row of dashes, giving the number of letters. If the guessing player suggests a letter or number which occurs in the word, the other player writes it in all its correct positions. If the suggested letter or number does not occur in the word, the other player draws one element of the hanged man stick figure as a tally mark. The game is over when:
>
> - The guessing player completes the word, or guesses the whole word correctly
> - The other player completes the diagram:

To get the hang of gameplay, here is an [online version to play](http://www.playhangman.com/PH.asp?g=cats)
- Between each guess, the board should be redrawn to the terminal output (Ascii art!).
- The letters that have already been guessed should be displayed before each time the player guesses.
- Use the colorize gem to make each piece of the hangman a different color.
- Use classes for each different idea represented in the game
- Place the application flow/logic in a method outside of any class,  call  this method at the end of the file to start the game.

```
|     _________
|     |/      |
|     |      (_)
|     |      \|/
|     |       |
|     |      / \
|     |
| ____|___
```
