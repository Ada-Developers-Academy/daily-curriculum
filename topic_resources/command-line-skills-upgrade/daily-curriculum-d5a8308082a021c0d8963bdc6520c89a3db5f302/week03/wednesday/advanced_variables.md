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
         # @name won't work be the same value
         puts "Rising..."
      end
    end

- Instance variables begin with `@`
- Instance variables are available to the object of it's initialization
- Instance variables are also used very commonly

#### Class Variables

    class Ghost
      @@lives = 10

      def self.rise_from_the_grave
        @@lives -= 1
        puts "Rising... You have #{@@lives} left"
      end

    end

- Class variables begin with `@@`
- Class variables are available to the entire class (in any method)
- Class variables will raise an error if they are read before they're created
- Class variables can cause problem down the road (avoid using them)
- Class variables are often used for application configuration

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

#### Predefined Global Variables

- $!		The exception information message set by the last 'raise' (last exception thrown).
- $@		Array of the backtrace of the last exception thrown.
- $&		The string matched by the last successful pattern match in this scope.
- $`		The string to the left of the last successful match.
- $'		The string to the right of the last successful match.
- $+		The last bracket matched by the last successful match.
- $1 to $9		The Nth group of the last successful regexp match.
- $~		The information about the last match in the current scope.
- $=		The flag for case insensitive, nil by default (deprecated).
- $/	 or $-0	The input record separator, newline by default.
- $\		The output record separator for the print and IO#write. Default is nil.
- $,		The output field separator for the print and Array#join.
- $;	 or $-F	The default separator for String#split.
- $.		The current input line number of the last file that was read.
- $<		An object that provides access to the concatenation of the contents of all the files given as command-line arguments, or $stdin (in the case where there are no arguments). Read only.
- $FILENAME		Current input file from $<. Same as $<.filename.
- $>		The destination of output for Kernel.print and Kernel.printf. The default value is $stdout.
- $_		The last input line of string by gets or readline.
- $0		Contains the name of the script being executed. May be assignable.
- $*	ARGV[1]	Command line arguments given for the script. Also known as ARGV
- $$	 or Process.pid	The process number of the Ruby running this script.
- $?		The status of the last executed child process.
- $:	$LOAD_PATH	Load path for scripts and binary modules by load or require.
- $"	$LOADED_FEATURES or $-I	The array contains the module names loaded by require.
- $stderr		The current standard error output.
- $stdin		The current standard input.
- $stdout		The current standard output.
- $-d	$DEBUG	The status of the -d switch. Assignable.
- $-K	$KCODE	Character encoding of the source code.
- $-v	$VERBOSE	The verbose flag, which is set by the -v switch.
- $-a		True if option -a ("autosplit" mode) is set. Read-only variable.
- $-i		If in-place-edit mode is set, this variable holds the extension, otherwise nil.
- $-l		True if option -l is set ("line-ending processing" is on). Read-only variable.
- $-p		True if option -p is set ("loop" mode is on). Read-only variable.
- $-w		True if option -w is set.

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
- A Constant is like a variable, except that its value is supposed to remain constant for the duration of the program.

#### Predefined Constants

```ruby
__FILE__ # current file
__LINE__ # current line
__dir__  # current directory
```
