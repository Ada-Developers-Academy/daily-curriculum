# Hash Practice
- In teams of two

- Pick an idea to represent in a `Hash` (people, plants, books, events, anything...), with at least four attributes.
- In a .rb file, write an `Array` of `Hash` objects that represent at least two different versions of the idea.
- Write a class for the idea that can have it's attributes set in `initialize`.
- Write a each loop for the `Array` that creates a new class instance and `puts` it's attributes

A simplified example:
```ruby
people = [
  {name: "B", ...},
  {name: "C", ...}
]
people.each do |hash|
  person = Person.new(hash)
  puts person
  puts person.name
end
```
