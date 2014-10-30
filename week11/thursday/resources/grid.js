(function(window){
  "use strict";

  var document = window.document;
  document.addEventListener( "DOMContentLoaded", function( e ){
    var cvs = document.querySelector( "#cvs" ),
      ctx = cvs.getContext( '2d' );

    var stepSize = 10,
      stepx = stepSize,
      stepy = stepSize,
      lineWidth = 0.5,
      strokeColor = 'lightgray';

    var axisColor = 'blue',
      axisLineWidth = 1.0,
      axisMargin = 40,
      axisOrigin = {
        x: axisMargin,
        y: cvs.height-axisMargin
      },
      axisTop = axisMargin,
      axisRight = cvs.width-axisMargin,
      axisHeight = axisOrigin.y - axisTop,
      axisWidth = axisRight - axisOrigin.x;

    var ticksColor = 'navy',
      tickWidth = stepSize,
      verticalTickSpacing = tickWidth,
      horizontalTickSpacing = tickWidth,
      numVerticalTicks = axisHeight / verticalTickSpacing,
      numHorizontalTicks = axisWidth / horizontalTickSpacing;

    var drawGrid = function( stepx, stepy, lineWidth, strokeColor ){
      ctx.strokeStyle = strokeColor;
      ctx.lineWidth = lineWidth;

      // Draw vertical lines
      for( var i = stepx + lineWidth; i < ctx.canvas.width; i += stepx ){
        ctx.beginPath();
        ctx.moveTo( i, 0 );
        ctx.lineTo( i, ctx.canvas.height );
        ctx.stroke();
      }

      // Draw horizontal lines
      for( var j = stepy + lineWidth; j < ctx.canvas.height; j += stepy ){
        ctx.beginPath();
        ctx.moveTo( 0, j );
        ctx.lineTo( ctx.canvas.width, j );
        ctx.stroke();
      }
    };

    var drawHorizontalAxis = function(){
      ctx.beginPath();
      ctx.moveTo( axisOrigin.x, axisOrigin.y );
      ctx.lineTo( axisRight, axisOrigin.y );
      ctx.stroke();
    };

    var drawVerticalAxis = function(){
      ctx.beginPath();
      ctx.moveTo( axisOrigin.x, axisOrigin.y );
      ctx.lineTo( axisOrigin.x, axisTop );
      ctx.stroke();
    };

    var drawVerticalAxisTicks = function(){
      var deltaX;

      for( var i = 1; i < numVerticalTicks; i++ ){
        ctx.beginPath();
        if( i % (verticalTickSpacing/2) === 0 ){
          deltaX = tickWidth;
        } else {
          deltaX = tickWidth/2;
        }

        ctx.moveTo( axisOrigin.x - deltaX, axisOrigin.y - (i*verticalTickSpacing));
        ctx.lineTo( axisOrigin.x + deltaX, axisOrigin.y - (i*verticalTickSpacing));
        ctx.stroke();
      }
    };

    var drawHorizontalAxisTicks = function(){
      var deltaY;

      for( var i = 1; i < numHorizontalTicks; i++ ){
        ctx.beginPath();
        if( i % (horizontalTickSpacing/2) === 0 ){
          deltaY = tickWidth;
        } else {
          deltaY = tickWidth/2;
        }

        ctx.moveTo( axisOrigin.x + (i*horizontalTickSpacing), axisOrigin.y - deltaY);
        ctx.lineTo( axisOrigin.x + (i*horizontalTickSpacing), axisOrigin.y + deltaY);
        ctx.stroke();
      }

    };

    var drawAxes = function(){
      ctx.strokeStyle = axisColor;
      ctx.lineWidth = axisLineWidth;

      drawHorizontalAxis();
      drawVerticalAxis();

      ctx.lineWidth = 0.5;
      ctx.strokeStyle = ticksColor;

      drawVerticalAxisTicks();
      drawHorizontalAxisTicks();

    };

    var drawLine = function( start, end ){
      ctx.beginPath();
      ctx.strokeStyle = axisColor;
      ctx.lineWidth = axisLineWidth;
      ctx.moveTo( axisOrigin.x + start.x*verticalTickSpacing, axisOrigin.y - start.y*horizontalTickSpacing );
      ctx.lineTo( axisOrigin.x + end.x*verticalTickSpacing, axisOrigin.y - end.y*horizontalTickSpacing );
      ctx.stroke();
    };

    /** start actual work */
    drawGrid( stepx, stepy, lineWidth, strokeColor );
    drawAxes();
    drawLine({ x: 0, y: 0 }, { x: 10, y: 15 });
    drawLine({ x: 10, y: 15 }, { x: 11, y: 9 });
    drawLine({ x: 11, y: 9 }, { x: 19, y: 10 });
    drawLine({ x: 19, y: 10 }, { x: 29, y: 20 });

  });
})(this);
