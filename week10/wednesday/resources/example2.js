(function(window){
  document.addEventListener( "DOMContentLoaded" , function( e ){
    var canvas = document.getElementById('canvas'),
      context = canvas.getContext('2d');

    var newVisitorsEl = document.querySelector( "#new" ), //document.getElementById( "new" );
      retVisitorsEl = document.querySelector( "#returning" ), //document.getElementById( "returning" );
      newVisitors = parseInt( newVisitorsEl.innerHTML, 10 ),
      retVisitors = parseInt( retVisitorsEl.innerHTML, 10 ),
      totalVisitors = newVisitors + retVisitors;

    var newInRads = (newVisitors/totalVisitors) * (Math.PI*2),
      retInRads = (Math.PI*2) - newInRads;

    var originX = canvas.width/2,
      originY = canvas.height/2,
      radius = canvas.height/2 - 10,
      counterClockwise = false;

    var newInRadsPercent = parseInt((newInRads/(newInRads + retInRads)) * 100, 10),
      retInRadsPercent = 100 - newInRadsPercent;

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
    context.strokeText( newInRadsPercent + "%",
                       canvas.width/2 +60,
                       canvas.height/2 +60
                      );
    context.fillText( newInRadsPercent + "%",
                       canvas.width/2 +60,
                       canvas.height/2 +60
                      );

    context.strokeText( retInRadsPercent + "%",
                       canvas.width/2 -60,
                       canvas.height/2 -60
                      );
    context.fillText( retInRadsPercent + "%",
                       canvas.width/2 -60,
                       canvas.height/2 -60
                      );
  });
}(this));
