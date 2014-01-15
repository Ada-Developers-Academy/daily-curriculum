(function(window){
  document.addEventListener( "DOMContentLoaded" , function( e ){
    var canvas = document.getElementById('canvas'),
      context = canvas.getContext('2d');

    context.font = '38pt Arial';
    context.fillStyle = 'blue';
    context.strokeStyle = 'blue';
    context.textAlign = "center";

    context.fillText( 'Hello Ada', canvas.width/2 , canvas.height/2 );
    context.strokeText( 'Hello Ada', canvas.width/2, canvas.height/2 );
  });
}(this));
