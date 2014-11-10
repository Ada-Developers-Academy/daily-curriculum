var count = 99;
var word = "bottles";

while (count > 0) {

	console.log(count + " " + word + " of beer on the wall");
	console.log(count + " " + word + " of beer,");
	console.log("Take one down, pass it around,");
	count = count - 1;
	if (count > 0) {
		console.log(count + " " + word + " of beer on the wall.");
	}
	else {
		console.log("No more " + word + " of beer on the wall.");
	}

}

