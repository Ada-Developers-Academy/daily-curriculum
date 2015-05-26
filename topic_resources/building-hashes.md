Use irb, a script, or object oriented class to convert the following string into a `Hash` with the given rules.

Breakfast
-------

```ruby
"first_name=Ada&last_name=Lovelace&dob=1815&title=Countess"
```

1. Separate each element on the `&` characters.
2. Separate key and value on the `=` character

Partial Example: `{first_name: "Ada", last_name: "Lovelace"}`

Lunch
-------

```ruby
"name=Ada*Lovelace&father=Lord*Byron&mother=Anne*Isabella*Milbanke"
```

1. Rules from Bronze
2. Convert any `*` characters into a space character

Partial Example: `{name: "Ada Lovelace"}`


Dinner
-------
Create a nested hash by separating the following into hashes

```ruby
"person[first_name]=Ada&person[last_name]=Lovelace&century=19th&topic=analytical*engine"
```

1. Rules from Bronze and Silver
2. `[*]` indicates a hash as a value, the word preceding the `[*]` is the key to the value and the word in the `[*]` is a key within the nested hash.

Partial Example: `{person: {first_name: "Ada", last_name: "Lovelace"}}`

Dessert
-----

```ruby
"person[first_name]=Ada&person[last_name]=Lovelace&skills[]=programming&skills[]=math"
```

1. Rules from Bronze, Silver, and Gold
2. An empty `[]` indicates an Array as a value. the word preceding the `[]` is the key to the Array the word after the `=` will be added to the array.

Partial Example: `{skills: ["programming", "math"]}`
