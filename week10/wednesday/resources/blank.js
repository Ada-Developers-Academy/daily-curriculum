(function(){
  var o1 = {
    contents: "Yo",
    id: "yo",
    type: "span"
  };
  var o2 = {
    contents: "What's",
    id: "whats",
    type: "span"
  };
  var o3 = {
    contents: "The",
    id: "the",
    type: "span"
  };
  var o4 = {
    contents: "Rumpus",
    id: "rumpus",
    type: "span"
  };

  var createAndAddElement = function( obj ){
    var el = document.createElement( obj.type );
    el.id = obj.id;
    el.innerHTML = obj.contents;
    document.body.appendChild( el );
  };

  document.addEventListener( "DOMContentLoaded", function( e ){
    [o1, o2, o3, o4].forEach( createAndAddElement );

    var yo = document.querySelector( "#yo" );
    yo.addEventListener( "click", function( e ){
      this.style.color = "red";
    });

  });


}());
