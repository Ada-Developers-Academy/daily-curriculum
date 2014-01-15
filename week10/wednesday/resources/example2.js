(function(window){
  document.addEventListener( "DOMContentLoaded" , function( e ){
    var canvas = document.getElementById('canvas'),
      context = canvas.getContext('2d');


    var newVisitorsEl = document.querySelector( "#new" ); //document.getElementById( "new" );
    var retVisitorsEl = document.querySelector( "#returning" ); //document.getElementById( "returning" );
    var newVisitors = parseInt( newVisitorsEl.innerHTML, 10 );
    var retVisitors = parseInt( retVisitorsEl.innerHTML, 10 );
    var totalVisitors = newVisitors + retVisitors;

    var newInRads = (newVisitors/totalVisitors) * (Math.PI*2);
    var retInRads = (Math.PI*2) - newInRads;

    var originX = canvas.width/2;
    var originY = canvas.height/2;
    var radius = canvas.height/2 - 10;

    var counterClockwise = false;

    context.beginPath();
    context.moveTo( originX, originY );
    context.arc( originX, originY, radius, 0, newInRads, counterClockwise );
    context.closePath();
    context.fillStyle = 'blue';
    context.fill();

    context.beginPath();
    context.moveTo( originX, originY );
    context.arc( originX, originY, radius, newInRads, newInRads + retInRads, counterClockwise );
    context.closePath();
    context.fillStyle = 'red';
    context.fill();

    context.font = '16pt Helvetica';
    context.strokeStyle = 'black';
    context.fillStyle = 'white';
    context.strokeText( parseInt((newInRads/(newInRads + retInRads)) * 100, 10) + "%",
                       canvas.width/2 +60,
                       canvas.height/2 +60
                      );
    context.fillText( parseInt((newInRads/(newInRads + retInRads)) * 100, 10) + "%",
                       canvas.width/2 +60,
                       canvas.height/2 +60
                      );

    context.strokeText( parseInt((retInRads/(newInRads + retInRads)) * 100, 10) + "%",
                       canvas.width/2 -60,
                       canvas.height/2 -60
                      );
    context.fillText( parseInt((retInRads/(newInRads + retInRads)) * 100, 10) + "%",
                       canvas.width/2 -60,
                       canvas.height/2 -60
                      );
  });
}(this));
