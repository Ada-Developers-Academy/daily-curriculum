# Object Inheritance
We use object inheritance for not only method inheritance but also object creation.

```ruby
class Animal
  def initialize(weight, age)
    @weight = weight
    @age = age
  end

  def move
    if @weight > 10
      puts "Maybe a slow mover!"
    else
      puts "Maybe a quick mover!"
    end
  end
end

class Bird
  def initialize(weight, age, can_fly)
    super(weight, age)
    @can_fly = can_fly
  end

  def move
    super
    if @can_fly
      puts "I can fly!!!"
    end
  end
end

animal = Animal.new(15, 15)

bird = Bird.new(2, 2, true)
bird.move
=> "Maybe a quick mover!"
"I can fly!!!"
```

# Object Composition
This is the concept that a class can be composed of other classes as parts, much like how a car has wheels.

A way to describe this is by using the "has-a" phrase: i.e. OrangeGrove has a(n) Orange Tree, Car has a Wheel.


From LRTHW:
  > You use the phrase is-a when you talk about objects and classes being related to each other by a class relationship. You use has-a when you talk about objects and classes that are related only because they _reference_ each other.

```ruby
class Code
    def initialize(person)
        @person = person
    end

    def make_bugs
        "#{@person.name} does some typing"
    end
end

class Developer
    def make_bugs
        Code.new(self).make_bugs
    end
end
```

In the example above, the "Developer 'has-a' Code". This relationship is established when the ```Developer``` method ```make_bugs``` creates a new instance of the ```Code``` class.
