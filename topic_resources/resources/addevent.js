(function(window){
  "use strict";

  var document = window.document;

  document.addEventListener( "DOMContentLoaded", function( e ){
    var btn = document.querySelector( "#numberInc" );
    var numberEl = document.querySelector( "#number" );

    btn.addEventListener( "click" , function( e ){
      var num = numberEl.innerHTML;
      var num1 = parseInt( num, 10 );
      num1++;
      numberEl.innerHTML = num1;
    });
  });
}(this));
