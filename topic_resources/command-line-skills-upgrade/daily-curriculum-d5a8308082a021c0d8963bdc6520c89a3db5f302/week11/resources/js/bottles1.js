var count = 99;
var word = "bottles";

while (count > 0) {

	console.log(count + " " + word + " of beer on the wall<br>");
	console.log(count + " " + word + " of beer,<br>");
	console.log("Take one down, pass it around,<br>");
	count = count - 1;
	if (count == 1) {
		word = "bottle";
		console.log(count + " " + word + " of beer on the wall.");
	}
	else if (count > 0) {
		word = "bottles";
		console.log(count + " " + word + " of beer on the wall.");
	}
	else {
		word = "bottles";
		console.log("No more " + word + " of beer on the wall.");
	}

}

