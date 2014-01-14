(function(){
  var name = "Jeff";

  var greeting = greet( name ); //=> TypeError

  var greet = function(param){
    return "Hey, " + param;
  };

  console.log( greeting );

}());

