(function(){
  var canv = document.querySelector( '#cvs' ); //document.getElementById( 'cvs' );
  var context = canv.getContext( '2d' );
  context.fillStyle = 'black';
  context.beginPath();

  var x = canv.width/2;
  var y = canv.height/2;
  var radius = (function(){
    if( x < y ){
      return x;
    }
    return y;
  }());
  var startDeg = 0;
  var endDeg = Math.PI;
  var counterClockwise = true;
  context.arc( x, y, radius, startDeg, endDeg, counterClockwise );
  context.fill();
}());
