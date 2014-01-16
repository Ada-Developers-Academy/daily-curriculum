(function( window ){
  "use strict";
  var document = window.document;

  document.addEventListener( "DOMContentLoaded", function( e ){
    var el = document.createElement( "span" );

    el.innerHTML = "JavaScript is awesome";

    var colorIt = function(){
      this.style.color = "green";
    };

    el.addEventListener( "click", colorIt );

    document.body.appendChild( el );
  });
})( this );
