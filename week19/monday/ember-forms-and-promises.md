# Ember Forms and Promises

In this lecture we will look at how to create an ember form, bind inputs, create
proxy objects, and how to handle the response of object creation using promises.

## Forms

Ember handles forms REALLY well. In rails we have to build a form that will 
submit static values that will map to an object. But in Ember we can bind the 
inputs directly to a javascript object. Using the `input` helper in ember it's
quite easy to accomplish this. Here is an example of a form to make a user with 
email address and username

```js
<div class='form-group'>
  <label for="useranme">Username</label>
  {{input type='text' value=username class='form-control'}}
</div>
<div class='form-group'>
  <label for="email">Email</label>
  {{input type='text' value=email class='form-control'}}
</div>
<button class='btn btn-success' {{action "create" this}}>Create</button>
```

The only lines that matter are the two with `{{input}}`. The `input` helper
takes several arguments, the `type` will be the type of input, the `value`
key indicates which attribute this input binds to.

The `model` for this form can be a newly created record. In the route file for 
this url:

```js
App.UsersNewRoute = Ember.Route.extend({
  model: function () {
    return this.store.createRecord("user");
  }
})
```

Now the `input`'s values will be bound to this newly created user record.

Let's create the action that will handle the saving of this object

```js
actions: {
  create: function (user) {
    user.save();
    this.transitionTo("user", user)
  }
}
```

The only problem with this approach is that each time we visit this route an
additional User model in memory. Revisiting several times will result in blank
objects building up in the users index view.

We can fix this problem by using a proxy object to bind the inputs to, then create
the model from the proxy's attributes. To do this we can just use a plain ol' 
javascript object (hash) as our model:

```js
model: function () {
  return {};
}
```

Now the form will map the values into this fake object, we can pass the fake object
into our `create` action, the use it to set the values of an actual model object.
Here is the action code to do this:

```js
actions: {
  create: function (proxy) {
    var user = this.store.createRecord("user", proxy);
    user.save()
    this.transitionTo("user", user)
  }
},
```

Remember in this case the `proxy` object is nothing more then a hash of key values
that were set by by typing values into the form. Which is convienient because the
`createRecord` method takes a second argument which is a hash of key values for 
the model.

Now the new page doesn't create a new model each time, so the User objects don't
build up in memory any longer.

## Promises

Now we will look at a simple promise to handle different results of this create
action. We will want the page to do as it is now, redirect to the `user` route,
when the user is successfully created, but if an error occurs, such as a validation
on our server side model we will want to show an error message and stay on the page.

The problem with the code now is that the `user` object will not obtain the data
from the HTTP request before the `transitionTo`, which is fine if everything saves
correctly because the `transitionTo` method will wait for the data to resolve.
But, if the creation doesn't happen, then we'll have no way to know, and the
`transitionTo` will still happen with a `null` object. So we want to utilize the
promise object returned by `createRecord` to figure out if this request was
successful or not.

Promises are objects that respond to the `.then` method, `.then` takes two functions
the first is the function to run in the case of success, the second is the function
to run if an error occures during the retreival of the promise:

```js
var user = this.store.createRecord("user", proxy);
user.save().then(
  function (user) {
    // The record was saved
    // the `user` var is the resolved user object
  }, 
  function (error) {
    // The record was not saved  
    // the `error` var is the error from the promise
})
```

So now we want to plug in our application logic here:

```js
var user = this.store.createRecord("user", proxy);
var self = this;
user.save().then(
  function (user) {
    self.transitionTo("user", user.get("id"));
  }, 
  function (error) {
    user.deleteRecord();
    alert(error.responseText)
    // Add a notification to the page
  }
)
```

So, we're saying `user.save()`, this returns a promise object, which we can then
call the method `.then`, first `function` is for success where we are transitioning 
to the `user` route. The next argument is another function, which will be run if
the promise failed, and the error returned when it failed will be returned. If
this is the case we're removing the record from memory (`.deleteRecord` only removes
from memory, not the DB). And note that the format above is just for clarity, this
could also be:

```js
var user = this.store.createRecord("user", proxy);
var self = this;
user.save().then(function (user) {
  self.transitionTo("user", user.get("id"));
}, function (error) {
  user.deleteRecord();
  alert(error.responseText)
  // Add a notification to the page
})
```

