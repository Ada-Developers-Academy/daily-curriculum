(function(){
  document.addEventListener( "DOMContentLoaded", function( e ){
    var cvs = document.querySelector( "#cvs" ),
      ctx = cvs.getContext( '2d' );

    var origin = {
      x: 0,
      y: ctx.canvas.height
    };
    var dimensions = {
      width: 50,
      height: 100
    };
    var fillColor = 'darkgoldenrod';
    var strokeColor = 'darkslategray';

    ctx.beginPath();
    ctx.fillStyle = fillColor;
    ctx.strokeStyle = strokeColor;
    //x, y, width, height
    ctx.rect(origin.x,
             origin.y - dimensions.height,
             dimensions.width,
             dimensions.height);
    ctx.stroke();
    ctx.fill();

  });
})();
