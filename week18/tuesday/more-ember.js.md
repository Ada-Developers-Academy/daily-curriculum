# More Ember

## Associations

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
anytime any of these attributes are modified.

## Actions