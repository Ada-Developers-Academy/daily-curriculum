
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

To close the REPL, type control + C twice, or `.exit`.

#### Question: Why use this instead of the JavaScript console in the browser?
It's important to be aware of options, and there are many useful `npm` packages that can provide additional functionality to the REPL. We're going to use it this morning primarily for the `.load` command.

[Read more about the features of Node's REPL here](https://nodejs.org/api/repl.html#repl_repl_features).
