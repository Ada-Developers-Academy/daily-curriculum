# Object Inheritance

Inheritance is used to model one class after another. We would want to do this when two objects share functionality. Often the parent class is more general, the child being more specific. For example, we could have a `Bird` class with more specific classes that inherit like `Penguin` and `Hawk`. A way to describe this is by using the "is-a" phrase: i.e. Penguin is a Bird, Hawk is a Bird.

```ruby
class Bird

  def talk
    puts "I'm a bird. Kah."
  end
end

class Penguin < Bird

end
```

In Ruby, we use the ```<``` symbol to denote that the class on the left of the ```<``` symbol is inheriting behaviors from the class on the right side of the ```<``` symbol.

### Inheriting Methods
So what do we get when we inherit? We get methods. So in the above the `Bird` class has a `talk` method defined.
Since all birds talk, our child classes will inherit this method. So now even our `Penguin` instances will have the talk method.

```ruby
generic_bird = Bird.new
generic_bird.talk
=> "I'm a bird. Kah."

penguin = Penguin.new
penguin.talk
-> "I'm a bird. Kah."
```

This is known as _implicit inheritance_ because when we put functionality in the _base class_ (```Bird```), then all _subclasses_ (```Penguin```) will automatically get those features.

### Overriding Methods
What happens when our classes have different functionality for the same idea? We can override methods from parent classes in the child.

```ruby
class Penguin < Bird
  def talk
    puts "I'm a bird. Sqwaaa."
  end
end

generic_bird = Bird.new
generic_bird.talk
=> "I'm a bird. Kah."

penguin = Penguin.new
penguin.talk
=> "I'm a bird. Sqwaaa."
```

In this case, you want to override the functionality that the _base class_ (```Bird```) provides, with more specific functionality in the _subclass_ (```Penguin```)

### `super`

It's also possible to use the parent method while also overriding in the child method.

```ruby
class Hawk < Bird
  def talk
    super
    puts "*soars*"
  end
end

generic_bird = Bird.new
generic_bird.talk
=> "I'm a bird. Kah."

hawk = Hawk.new
hawk.talk
=> "I'm a bird. Kah.
*soars*"
```

In this case, you want to utilize the behavior that the _base class_ (```Bird```) provides but augment it with functionality specific to the _subclass_ (```Hawk```).

[bird](../topic_resources/animal_farm/bird.rb)
[penguin](../topic_resources/animal_farm/penguin.rb)
[dog](../topic_resources/animal_farm/dog.rb)
