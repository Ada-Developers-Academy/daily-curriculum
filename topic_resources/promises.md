[Google presentation](https://docs.google.com/presentation/d/13664MwNIHq-qs6MMVqoDqtpwFw_R7b8yNfV_JB87Vxo/edit?usp=sharing)

[Recording](https://www.youtube.com/watch?v=U9lTRMRuY7A&feature=youtu.be)

#Promise Objects and Asynchronous Calls

Promise objects and asynchronous calls are very, very important. If you're only
going to pay attention to one lecture this project, make it this one, because
promise objects are a basic but hugely important structure that you use in many
different parts of many different apps. This is probably the most widely
applicable bit if information you'll learn this whole project, and anyone who
teaches frameworks or Ajax calls without talking about promise objects should
be fired.


##Asynchronous calls

Yup, we're talking about this again.

Languages that make synchronous calls wait until a line of code is resolved
before it moves on to the next call. This is most important in the context of
making API or data calls; a Rails app making an HTTParty request for data will
wait until it gets a response to that request before it moves on to the next
line of code.

Languages that make asynchronous calls, however, do not wait until a line of code 
is resolved before moving on to the next call. This means that if an asynchronous
call language, like JavaScript, makes a call with, say, Ajax, it won't wait until
it gets a response to that request before moving on to the next line of code.


##The problem

So, why do we care? Why is this important?

A common use of API calls, particularly in front-end frameworks, is to get data
and assign it to a variable. A lot of the time, we want that to look something
like this:

    //pseudo-code wooooo!
    var results = ajax.make-a-call;
    results.each do a-thing

This works just fine in synchronous languages. However, it doesn't work very well
in asynchronous languages.

Remember that even fast API calls take time; let's say that this one takes half a
second. If we look at that code above, a synchronous language will do the
following steps:

1) Make an Ajax call

2) Hang out and wait for a response

3) Get a response

4) Assign that response to the variable `results`

5) Begin an `each` block using the results of the Ajax call

However, an asynchronous language will do the following steps:

1) Make an Ajax call

2) Don't hang out and wait, because JS is too cool for school

3) Try to execute an `each` block with the `results` variable--but `results` 
doesn't exist yet

4) Throw an error, because it `results` is undefined

5) Get a response

So, this obviously won't do. Our asynchronous calls are giving us a really slick,
awesome-looking app, but we can't do anything with any data!


##Promises and deferreds

Luckily, we have promise objects and deferred objects to help us!

Promise objects are placeholder objects for data that you're still waiting to
get back, and deferred objects are placeholder objects for the results of some
evaluation you do with those promise objects.

Now, deferreds can be very useful, but to be honest the difference in use/in your
life is primarily syntax until you're a pretty advanced JavaScript developer.
For the purposes of this class, we're just going to talk about promises.

So, if we rewrote the code above to actually work with asynchronous calls, it
would look something like this:

    //pseudo-code wooooo!
    ajax.make-a-call.success(function(data, status, headers, config){
      var results = data
      results.each do a-thing
    })

And the steps taken would look like this:

1) Make an Ajax call

2) Move on to the code after the code we have here, because API calls are sloooow

3) Get a response

4) Execute the `success` block

  i) Assign that response to the variable `results`

  ii) Begin an `each` block using the results of the Ajax call


##Promise states

A lot of the functionality of a promise object comes from the object's states.
There are three main states, which are called different things depending on the
language used or the context, but which do basically the same thing.


###Pending - Unfulfilled - Waiting

This is the state of a promise object that has not yet gotten a response from its
API call. In theory, you could use this state to show things like a loading bar, but in reality we don't typically use the pending state to write blocks of code;
instead, we talk about the pending state and actually write code in the other two
states.


###Fulfilled - Resolved - Success

This is the state of a promise object that returns a result that it believes was 
a successful result. Note that the object determines the difference between a
success and a failure based on request headers--a result that returns empty data
or data that doesn't make sense but also returns a `200` code will enter the `success` state.

The `success` state block also takes several parameters: data, status, headers,
config; these are variable names representing the different things returned by
the call. You can then access all of the information returned and strip it out. 
`data` is typically the actual information you're looking for.


###Rejected - Failed - Error

This is the state a promise enters when it gets a response header that indicates
that the request failed, like a `404`. The `error` state block also takes the
data, status, headers, and config params, so you can look at what the API is 
returning here, too.


##Additional syntax

The syntax you use for your promise object will vary depending on the language 
you are using, the frameworks you are using, and the libraries that you are
using. Generally speaking, however, there are two main syntaxes:


###First syntax

    ajax.call(params)
      .success(function(data, status, headers, config){
        //do the thing
      })
      .error(function(data, status, headers, config){
        //do the other thing
      })

This syntax chains off of the Ajax call. `ajax.call(params)` returns a promise
object, and `.success` is a method that executes if the state of this promise
object is 'resolved', while `.error` is a method that executes if the state of 
this promise object is 'failed'.


###Second syntax

    var promise = ajax.call(params)
    promise.then(function(data){
      //do the thing
    }, function(msg){
      //do the thing
    })

Instead of chaining off of the creation of the promise object, this syntax
creates a promise object and then calls the `.then` method on it. `.then` is a
method that takes two parameters. 

The first `.then` parameter is a block that executes if/when the promise object
enters the 'success' state. It takes a parameter, typically called `data`; this
is all ofthe data returned by the API in an object that looks something like
`{data: stuff, status: stuff, headers: stuff, config: stuff}`. Due to this 
structure, it isn't uncommon for the block of this function to be 
`var results = data.data` or something similar.

The second `.then` parameter is a block that executes if/when the promise object 
enters the 'failed' state. This block can optionally take a parameter, 
conventionally called `error`, `e`, or `msg`, that contains the response from 
that request. If you're lucky and the API is well-written, this response will 
include details and a failure message. If you aren't, you might get nothing but 
the error code.


###Differences between the syntax

The main differences between the syntax, as you can see, are that 

1) the first syntax chains up to two functions off the promise object right 
after it has been instantiated, while the second syntax creates the object and 
then calls a single method on it, and

2) the first syntax returns the object parsed out for you, while the second
object returns a single unparsed chunk of data.

In my experience, there doesn't seem to be a hard and fast rule for when you use 
the first syntax vs. when you use the second. Typically, you use the first 
syntax on easy, short, infrequent calls, while you might use the second syntax
on more complicated calls where you're doing more complex things with the data
returned.



##The takeaway

Promise objects are very important in JavaScript; they are objects that act as
placeholders for data you have requested but not yet received. All promise 
objects have states--pending, success, and error--that you use to determine how
you want to use and display the data that you receive from an API call.

Later today, we'll talk about how to actually put this into practice by making an
API call to our data source. In the meantime, continue working on your Blahg and
see what questions you have about this or about AngularJS.