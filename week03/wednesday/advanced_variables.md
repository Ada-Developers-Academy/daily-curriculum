## Advanced Variables

There are 5 types of variables in ruby


| Type             | Begins With  | Scope                                          |
|:----------------:|:------------------:|------------------------------------------|
|Local variable    | **a-z** *or* **_** | Available only within the immediate scope.
|Instance variable | **@**              | Available to a specific instance of a class
|Class variable    | **@@**             | Available anywhere in a specific class (including all instances) (avoid me)
|Global variable   | **$**              | Available everywhere (don't use me).
|Constant  | **ALL_CAPS**       | Available in the scope they are defined in.

#### Local Variable

    my_name = "Bookis"

- Local variables start with a lowercase letter or an underscore. 
- Local variables are only available within the block of its initialization.
- Local variables will raise an error if they are read before they're created
- Local variables are used often

#### Instance Variables

    class Ghost
      def initialize(name_var)
        @name = name_var
      end
      
      def name
        @name
      end
      
      def self.rise_from_the_grave
         # @name won't work here because this is a class method
         puts "Rising..."
      end
    end
    
- Instance variables begin with `@`
- Instance variables are available to the object of it's initialization
- Instance variables are also used very commonly

#### Class Variables

    class Ghost
      @@opacity = 0.72
      
      def self.rise_from_the_grave
         puts "Rising... You can see #{@@opacity * 100}% of me"
      end
      
      def color
        "#{@color} at #{@@opacity * 100}% opacity"
      end
      
      def color=(color_var)
        @color = color_var
      end
      
    end
    
- Class variables begin with `@@`
- Class variables are available to the entire class (in any method)
- Class variables will raise an error if they are read before they're created
- Class variables can cause problem down the road (avoid using them)

#### Global Variables

    $dead = true
    
    class Ghost
    
      def is_dead?
        $dead
      end
      
    end
    
- Global variables begin with `$`
- Global variables are available to the entire application
- Global variables are dangerous (don't use them)

#### Constants
    
    class Ghost
      CEMETARY = "Lake View"
     
      def address
        CEMETARY
      end
    end
    
    Ghost::CEMETARY
    
- Constants are all uppercase with using underscores to separate words
- Constants are available within the scope of it's initialization
- Constants will raise an error if they are read before they're created
- Constants can be used outside of it's scope through the class it was instanciated
- Used a lot in Rails, not so much in projects so far
    