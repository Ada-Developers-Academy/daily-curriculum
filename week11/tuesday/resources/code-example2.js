(function(){
  var name = "Jeff";

  var greeting = greet( name );

  function greet(param){
    return "Hey, " + param;
  }

  console.log( greeting ); //=> "Hey, Jeff"

}());

