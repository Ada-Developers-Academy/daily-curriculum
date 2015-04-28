(function( window ){
  "use strict";

  var printHref = function( link ){
    window.console.log( link.href );
  };

  window.document.addEventListener( "DOMContentLoaded" , function( e ){
    var links = window.document.querySelectorAll( "a" );
//    Array.prototype.forEach.call( links , printHref );
    Array.prototype.forEach.call( links , function( link, index, array ){
      window.console.log( link.href );
    } );
  });

}(this));
