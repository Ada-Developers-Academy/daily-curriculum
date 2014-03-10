# More Ember

## Associations

`ember-data` provides a syntax for identifying and naming associations within
models. Similar to rails we have `hasMany` and `belongsTo`, these method replace
the data type of an attribute declaration within a model. In a model `blog.js`
which we want to have many posts:

```js
App.Blog = DS.Model.extend({
  name: DS.attr("string"),
  posts: DS.hasMany("blog", {async: true})
})
```

Now an instance of `Blog` will have a method `posts` which will return an array
of `Post` objects. The way we specifify which `Post` objects to find in JSON is
using an array of ID's, for example with the fixture data

```js
App.Blog.FIXTURES = [
  {
    id: 1,
    name: "Bookis Talk",
    posts: [1,2,10]
  }
]
```

When the `Blog` with an ID of 1 is loaded, the `Post` object 1,2, and 10 will be
associated to it. The `{async: true}` portion is needed if you want this object
to handle the loading of the `Post` data.


## Computed Properties
A Model's Computed properties are similar to methods on an ActiveRecord class,
you can use and manipulate the classes attributes to return a new value. For
example:

```js
App.Person = Ember.Model.extend({
  firstName: DS.attr("string"),
  lastName: DS.attr("string"),

  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName')
});

person.get('fullName') // "Bookis Smuin"
```

The `fullName` attribute referres to a `function`, inside of this `function` we
are contatenating the `firstName` and `lastName` attributes joined by a space.

After ending the `function` we are calling `.property` and listing any attributes
that were used inside function. This tells the model to re-evaluate the function
anytime any of these attributes are modified. Any computed property will be 
updated within the view when the referenced attributes are changed.

Computed properties can even use other computed properties.

```js
App.Person = Ember.Model.extend({
  firstName: DS.attr("string"),
  lastName: DS.attr("string"),

  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName'),
  
  reverseName: function() {
    return this.get("fullName").split("").reverse().join("");
  }
});

person.get('reverseName') // "niumS sikooB"
```

## Actions

Actions have a couple different components, the template helper `action` and
the definition of an action within the controller or route file. In a `.handlebars`
file we can use the `action` helper to bind an event (like clicking a link) to an
action.

```html
<h1>A Website</h1>

<button {{ action "createPost" }} class='btn btn-success'>Create</button>
```

The button we've just created has an `action`
  