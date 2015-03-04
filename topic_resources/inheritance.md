# Object Inheritance

Inheritance is used to model one class after another. We would want to do this when two objects share functionality.
Often the parent class is more general, the child being more specific. For example, we could have a `Bird` class
with more specific classes that inherit like `Penguin` and `Hawk`.

```ruby
class Bird

  def talk
    puts "I'm a bird. Kah."
  end
end

class Penguin < Bird

end
```

### Inheriting Methods
So what do we get when we inherit? We get methods. So in the above the `Bird` class has a `talk` method defined.
Since all birds talk, our child classes will inherit this method. So now even our `Penguin` instances will have the talk method.

### Overriding Methods
What happens when our classes have different functionality for the same idea. We can override methods from parent classes in the child

```ruby
class Penguin < Bird
  def talk
    puts "I'm a bird. Sqwaaa."
  end
end
```

### `super`

It's also possible to use the parent method WHILE overriding in the child method.

```ruby
class Hawk < Bird
  def talk
    super
    puts "*soars*"
  end
end
```

[bird](resources/animal_farm/bird.rb)
[penguin](resources/animal_farm/penguin.rb)
[dog](resources/animal_farm/dog.rb)
