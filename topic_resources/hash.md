# Hashes

Hash's in Ruby are used often to represent an object instead of or before an actual class object.
This often happens when we get some type of input that can be parsed into sane parts. This could come in many different formats such as JSON, XML, YAML, or CSV.
For example if we have some data:

| name              | email                                   |
|:----------------- |:----------------------------------------|
| Jeremy Flores     | jeremy@adadevelopersacademy.org
| Kari Bancroft     | kari@adadevelopersacademy.org

Each line of this could be represented as a hash, using the headers as the keys:

```ruby
person1 = {name: "Jeremy Flores", email: "jeremy@adadevelopersacademy.org"}
person2 = {name: "Kari Bancroft", email: "kari@adadevelopersacademy.org"}
```

Further we could groups these in an Array:
```ruby
people = [
  { name: "Jeremy Flores", email: "jeremy@adadevelopersacademy.org" },
  { name: "Kari Bancroft", email: "kari@adadevelopersacademy.org" }
]
```

A `Hash` key can have any object as it's value, even another hash.

```ruby
{ jeremy:
  {
    last_name: "Flores",
    first_name: "Jeremy",
    address: {
      street: "123 fake st",
      city: "Seattle",
      state: "WA"
    },
    pets: [
      {
        name:    "Rosalita",
        species: "dog"
      },
      {
        name:    "Raquel",
        species: "cat"
      }
    ]
  }
}
```

## Using Hash to initiate objects
A Hash is a great way to pass in arguments to `initialize`, first let's look at a use case for this.
```ruby
class Address
  def initialize(first_name, last_name, street_one, street_two, city, state, country, postal_code)
    @first_name  = first_name
    @last_name   = last_name
    @street_one  = street_one
    @street_two  = street_two
    @city        = city
    @state       = state
    @country     = country
    @postal_code = postal_code
  end
end
```

What's the problem here? What happens if you don't have a `street_two` attribute?

Let's try again using a hash:
```ruby
class Address
  def initialize(address_hash)
    @first_name  = address_hash[:first_name]
    @last_name   = address_hash[:last_name]
    @street_one  = address_hash[:street_one]
    @street_two  = address_hash[:street_two]
    @city        = address_hash[:city]
    @state       = address_hash[:state]
    @country     = address_hash[:country]
    @postal_code = address_hash[:postal_code]
  end
end

Address.new(first_name: "Jeremy", state: "WA")
```

Using a hash to provide parameters to a class' `initialize` method lets us omit parameters that may not exist for some instances. It also adds clarity to instantiation process by explicitely providing keys and values.

Compare:

```ruby
Address.new(first_name: "Jeremy", state: "WA")
```

with

```ruby
Address.new("Jeremy","","","","WA","","")
```
