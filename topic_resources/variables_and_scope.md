## Variables and Scope

There are 5 types of variables in ruby but we will look at the 2 most common


| Type             | Begins With  | Scope                                          |
|:----------------:|:------------------:|------------------------------------------|
|Local variable    | **a-z** *or* **_** | Available only within the immediate scope.
|Instance variable | **@**              | Available to a specific instance of a class

#### Local Variable

```ruby
my_name = "Kari"
```

- Local variables start with a lowercase letter or an underscore.
- Local variables are only available within the block of its initialization.
- Local variables will raise an error if they are read before they're created
- Local variables are used often

#### Instance Variables
```ruby
class Ghost
  def initialize(name_var)
    @name = name_var
  end

  def name
    @name
  end

  def full_name
    if @name == "casper"
      "#{@name} the ghost"
    else
      @name
    end

  end

  def self.rise_from_the_grave
     # @name won't work here because this is a class method
     puts "Rising..."
  end
end
```

- Instance variables begin with `@`
- Instance variables are available to the object of it's initialization
- Instance variables are also used very commonly

Scope
-----

We've been talking about the scope that variables are available in, in the current context this mostly applies to local variables, so lets talk about those first.
Local variables are only available inside their block level and it's children blocks. An easy way to remember this, local variables can't travel left

```ruby
def desserts
  some_var = "Pie" # This will be available to any child defined within this same method.

  if true
    inner_var = "Chocolate" # This is not available outside of the if statement, but is inside the each block
    [1,2,3,4].each do |n|
      most_inner_var = n > 3 # This is only available within the each block
      puts "I love #{inner_var}. " * n if most_inner_var
    end
  end
end
```

Instance variables are only available anywhere within instance methods of a class.

```ruby
class User

  def username
    @username
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def full_name
    if @first_name && @last_name
      "#{@first_name} #{@last_name}"
    else
      @username
    end
  end

  def self.active_users
    # Instance variables are not available here, this is a class method
    User.all.active
  end
end
```
