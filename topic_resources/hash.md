# More About Classes: Using Hashes and Establishing Default Values

## Hashes: A Quick Refresher
Hashes in Ruby are used often to represent an object instead of or before an actual class object.
This often happens when we get some type of input that can be parsed into sane parts. This could come in many different formats such as JSON, XML, YAML, or CSV.
For example if we have some data:

Why isn't this updating?

| name              | email                                   |
|:----------------- |:----------------------------------------|
| Jeremy Flores     | jeremy@adadevelopersacademy.org
| Kari Bancroft     | kari@adadevelopersacademy.org

Each line of this could be represented as a Hash, using the table headers as _keys_:

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

A Hash _key_ can have any object as its _value_, even another Hash.

```ruby
{ jeremy: # this is the key
  { # this entire hash is the value
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
A Hash is a great way to pass in arguments to the `initialize` method of a Class. Have a look at this Class:

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

## Default Attribute Values for Methods

It's very common for a method to have optional arguments. These arguments can represent common values, slightly modified functionality, or similar minor deviations.

__Every method should embrace SRP (single responsibility principle).__

Here's a method that might look familiar:

```ruby
def exponate(base, power)
  base ** power
end
```

We can define an optional argument by assigning a default value to an argument in the method declaration:

```ruby
def exponate(base, power = 2)
  # if we don't pass in a power, it will be assigned 2 by default
  base ** power
end

exponate(2)
exponate(2, 3)
exponate(4)
```

__Question: Is this a good use case for an optional argument?__

Let's look at another example:

```ruby
def exponate(base, power, abs = false)
  if abs
    (base ** power).abs
  else
    base ** power
  end
end

exponate(2)
exponate(-2, 3)
exponate(-2, 3, true)
```

__Question: Is this a good use case for an optional argument?__
