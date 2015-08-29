# JavaScript 103: Closures

## To start, let's get a JavaScript REPL installed.
`REPL` is an acronym for read-evaluate-print-loop. It's a program that provides an interpreter through which we can execute code and immediately see the results. Both `irb` and the Rails console are REPLs.

For JavaScript, we are going to use [Node](https://nodejs.org/) as our REPL. Node's primary responsibility is not providing a REPL, it's just a handy side effect. It's not as robust or as friendly as `irb`, but it's still plenty useful.

To get started, let's install Node. Open your terminal and do `brew install node`. You should get something like:

```bash
jeremy@iridium ~ ❤  brew install node
==> Downloading https://homebrew.bintray.com/bottles/node-0.12.7.yosemite.bottle.tar.gz
Already downloaded: /Library/Caches/Homebrew/node-0.12.7.yosemite.bottle.tar.gz
==> Pouring node-0.12.7.yosemite.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/0.12.7: 2726 files, 31M
```

Installing Node gives us access to the REPL by running the `node` command. It also installs the Node Package Manager (`npm`), which is a way to distribute and use JavaScript modules. It's very similar to Ruby gems.

Start the REPL by typing `node` in the terminal. You'll get a caret (`>`) prompt. From here, you can enter code and have it evaluated, similar to what's done in the browser console:

```bash
jeremy@iridium ~ ❤  node
> var x = 7;
undefined
> x + 2
9
> typeof x
'number'
```

#### Question: Why use this instead of the JavaScript console in the browser?
It's important to be aware of options, and there are many useful `npm` packages that can provide additional functionality to the REPL. We're going to use it this morning primarily for the `.load` command.

[Read more about the features of Node's REPL here](https://nodejs.org/api/repl.html#repl_repl_features).

## Closures

Ok, so what's a closure and why does it matter? A closure is an inner function that has access to the outer (enclosing) function’s variables. The closure has three scope chains: it has access to its own scope (variables defined between its curly brackets), it has access to the outer function’s variables, and it has access to the global variables. __A _closure_ is created when an inner function refers to an outer function's variables.__

To see how closures are used in Javascript, let's make some objects in both Ruby and JavaScript that do similar things, then see how we might leverage a closure to make our code more powerful and concise.

### To the sandbox!

```bash
cd ~/sandbox
mkdir closure-practice
cd closure-practice
touch closure.rb
touch closure.js
subl .
```

In your editor, open `closure.rb` and paste this code:

```ruby
class Powerer
  def squarer(num)
    num ** 2
  end

  def cuber(num)
    num ** 3
  end
end
```

Let's open it in `irb` and give it a whirl: `irb -r ./closure.rb`. This is great as long as all we want to do is square and cube numbers. But what if our requirements changed and we suddenly needed to raise numbers to the 9th power? 5th power? What are our options?

#### Question: No, really. What are our options?

Ok. Let's look at how we'd do this in JavaScript. Open `closure.js` in your editor and copypasta this in:

```javascript
function squarer(num) {
  return Math.pow(num, 2);
}

function cuber(num) {
  return Math.pow(num, 3);
}
```

Ok. Same thing. Let's take a look at this in the node REPL. Start the REPL by typing `node` in the terminal then load our file with: `.load closure.js`. This will open the file and enter it, line by line, into the REPL. Weird, but workable. Give our functions a try. `squarer(2)` and `cuber(2)` and `squarer(cuber(2))` all work as you'd expect, yeah?

So, same questions: what if our requirements changed and we suddenly needed to raise numbers to the 9th power? 5th power? What are our options?

### Enter Closures.
So the paragraph at the top of the page told us that a closure is created when a function access varirables not defined in its local scope, but in its parent scope.  Using this idea, we can create a function that provides us the functionality and flexibility we're looking for. Let's modify `closure.js` to leverage a closure:

```javascript
function powerer(p) {
  var power = p;
  var mather = function(num) {
    return Math.pow(num, power);
  }

  return mather
}
```

The outer function, `powerer`, defines a local variable (`power`) and a function (`mather`). It then returns `mather`. The innter function references `power`, a local variable defined in the outer function. Therefore, when invoked, a closure is created so that `mather` knows what `power` is supposed to be. Let's try it out in the Node REPL:

```javascript
.load closure.js

var squarer = powerer(2);
var cuber = powerer(2);
var niner = powerer(9);

squarer(2);
cuber(2);
niner(2);
niner(cuber(squarer(2));
```

Everytime we call `powerer()`, a new closure is created. The `mather` function is returned and assigned to a variable (like `cuber`). Invoking `cuber(3)` executes the `mather` function, which references `power`, which will has the value assigned to it when the closure was created.

### Closure Chair-Pair Exercise

Define a function named `makeAccumulator` that takes no arguments. It should create and return a function that takes __one__ argument and __returns a running total of all the arguments it has seen__. _E.g_ if `f` is the function returned by `makeAccumulator`, the first time you call `f(3)` it should return _3_, then if you call `f(2)`, it should return _5_. If you called `f(1000)` after that, it should return _1005_.

