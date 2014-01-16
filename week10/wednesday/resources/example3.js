(function(){
  document.addEventListener( 'DOMContentLoaded', function( e ){
    var canvas = document.getElementById( 'cvs' ),
      context = canvas.getContext( '2d' );

    context.strokeRect( canvas.width/2 - 25, canvas.height/2 - 100, 50, 200 );
    context.fillRect( canvas.width/2 - 25, canvas.height/2 - 100, 50, 200 );

  });
}());
