$(document).ready(function(){

  /* Stores the board info
    0 for empty
    1 for ship
    X when hit
  */
  var board = [];

  // Stores the locations of the ships
  var ships = [];

  // Current number of ships
  var shipNum = 2;

  // Size of the board
  var boardSize = 10;

  // Bool indicating whether or not game is over
  var gameOver = false;

  // Number of ship hits
  var hits = 0;

  // Number of guesses
  var guesses = 0;

  initializeGame();

  function initializeGame(){
    generateRandomBoard();
    printBoard();
  }

  function generateRandomBoard(){
    // Add some random ships
    var shipsAdded = 0;
    while (shipsAdded < shipNum) {
      var randomVal = Math.floor(Math.random() * (boardSize - 1));
      if (ships.indexOf(randomVal) < 0) { // Not already one of the ships
        ships.push(randomVal);
        shipsAdded++;
      }
    }

    // Set the board values based on ships added
    for(var j = 0; j < boardSize; j++) {
      if (ships.indexOf(j) < 0) { // This location not a ship
        board[j] = 0;   // Empty
      } else {
        board[j] = 1;   // Ship!
      }
    }
  }

  function printBoard() {
    var boardOut = "";
    for(var i = 0; i < boardSize; i++) {
      boardOut += board[i];
    }
    $("#board").text(boardOut);
  }

  function endGame() {
    // TODO: End game
    // ADDED FUN: Disable submit button
    console.log("End game");
  }

  // CLICK HANDLERS
  $("#submit").click(userGuess);

  function userGuess(){
    // Retrieve the guess from the input box

    // Reset the guess input box

    // Verify the guess is in a valid range

    // Check if the guess matches one of our ships locations
    // If it does, mark is as a HIT
    // If it doesn't, mark it as a MISS

    // Continue gameplay
    // Redraw the board if it has changed
    // Tell the user how many guesses they've made

    // NOTE: How does the game end?
  }
});
