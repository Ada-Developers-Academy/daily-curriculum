# MasterMind

Create a mastermind game that can be played from the Terminal.

The rules according to Wikipedia are below. To get the hang of gameplay, [here is an online version to play](http://www.web-games-online.com/mastermind/).

- Between each guess, the board should be redrawn to the terminal output (Ascii art!).
- The player should be able to pick a difficulty level, which reduces the number of rows (guesses).
- Use classes for each different idea represented in the game
- Place the application flow/logic in a method outside of any class,  call  this method at the end of the file to start the game.

> The game is played using:
>
> a decoding board, with a shield at one end covering a row of four large holes, and twelve (or ten, or eight, or six) additional rows containing four large holes next to a set of four small holes;
> code pegs of six (or more; see Variations below) different colors, with round heads, which will be placed in the large holes on the board; and
> key pegs, some colored or black, some white, which are flat-headed and smaller than the code pegs; they will be placed in the small holes on the board.
> The two players decide in advance how many games they will play, which must be an even number. One player becomes the codemaker, the other the codebreaker. The codemaker chooses a pattern of four code pegs. Duplicates are allowed, so the player could even choose four code pegs of the same color. The chosen pattern is placed in the four holes covered by the shield, visible to the codemaker but not to the codebreaker.
>
> The codebreaker tries to guess the pattern, in both order and color, within twelve (or ten, or eight) turns. Each guess is made by placing a row of code pegs on the decoding board. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of the row with the guess. A colored or black key peg is placed for each code peg from the guess which is correct in both color and position. A white key peg indicates the existence of a correct color code peg placed in the wrong position.
>
>
> Screenshot of software implementation (ColorCode) illustrating the example.
> If there are duplicate colours in the guess, they cannot all be awarded a key peg unless they correspond to the same number of duplicate colours in the hidden code. For example, if the hidden code is white-white-black-black and the player guesses white-white-white-black, the codemaker will award two colored key pegs for the two correct whites, nothing for the third white as there is not a third white in the code, and a colored key peg for the black. No indication is given of the fact that the code also includes a second black.
>
> Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the codebreaker guesses correctly, or twelve (or ten, or eight) incorrect guesses are made.
>
> The codemaker gets one point for each guess a codebreaker makes. An extra point is earned by the codemaker if the codebreaker doesn't guess the pattern exactly in the last guess. (An alternative is to score based on the number of colored key pegs placed.) The winner is the one who has the most points after the agreed-upon number of games are played.
