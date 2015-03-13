(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){
    // Get my canvas
    var canvas = document.querySelector( "#canvas" );
    // Get the context
    var context = canvas.getContext( '2d' );
    var drawBarRect = function( height, color, xCoord ){
      context.beginPath();
      // draw the rectangle
      var rectWidth = 50;
      var rectHeight = height;
      var x = xCoord;
      var y = canvas.height - rectHeight;
      // .rect( x, y, width, height )
      // x, y are top left
      context.rect( x, y, rectWidth, rectHeight );
      context.fillStyle = color;
      context.fill();
    };

    drawBarRect( 100, 'blue', 75 );
    drawBarRect( 200, 'green', 200 );
    drawBarRect( 75, 'orange', 300 );

  });
})();
