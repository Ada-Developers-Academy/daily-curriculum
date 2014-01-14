(function( window ){

  var printHref = function( link ){
    console.log( link.href );
  };

  document.addEventListener( "DOMContentLoaded" , function( e ){
    var links = document.querySelectorAll( "a" );
    Array.prototype.forEach.call( links , printHref );
  });

}(this));
