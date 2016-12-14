# Debugging Process and Tools

Debugging is one of the hardest parts about programming. In order to
effectively find and eliminate bugs we need to develop repeatable
processes and tests.

We rely on:

* Process, to make sure that we're not letting things fall through the
  cracks and so we can eliminate potential problems. (E.g. how we step
  through code, when we turn to the console, debugger, etc.)

* And tools, to provide visibility into what's happening and to help
  verify our assumptions programatically. (E.g. the rails console,
  logging, Chrome DevTools).

## Tips for Developing a Solid Debugging Process

### Review the [problem solving approach](../week07/friday/problem_solving.md) from week 7!

Dig back up the process that we talked about in week 7:

1. Understand the problem (draw figures, separate variables, examine the unknown)

1. Devise a plan (identify tools that may help you better understand
   the unknown, figure out how to examine the things in your program
   that change).

1. Carry out the plan (grunt work).

1. Examine your results--if you can't verify the effects of your
   changes, you can't know what's worked or how a bug got fixed.

1. Repeat if necessary!

Tools are an essential part of #2, #3, and #4. In rails we have Pry,
Rspec, mocks and stubs. In the browser we primarily have the developer
tools. Part of step #2 is figuring out which tools can help you
identify your problem.

Your problem solving process is one of your most important skills as a
software developer. If you are going to study one thing for technical
interviews, practice stepping through the list above when you solve
problems!

### SLOW DOWN

It's counter intuitive but: *slowing down during debugging will make
your debugging go faster.*

Every skipped step (as trivial as it may seem) is one more thing to
keep track of! Step through your code slowly, and *verify every step*.

Some notes on slowing down:

* Only change one thing at a time, be it a system, a piece of data, or
  piece of code. If you change multiple things at once you won't be
  able to track what actually caused things to change and how.

* Verify all your assumptions. If you think something is true, verify
  it by logging it, or double checking in the debugger. Even if it
  seems too simple to go wrong!

* Identify all the moving parts (e.g. rails view code, JS executed in
  the browser, rails Ajax endpoints in your controllers, JS sent back
  and executed in the browser after a response), and try to eliminate
  the systems one by one.

* Put your keyboard aside and trace through the problem or code step
  by step, using a whiteboard or pencil and paper. Track the values of
  all the variables at every step. Try to have an idea how to solve
  the problem before touching the code!

