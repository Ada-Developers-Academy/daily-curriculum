# Date & DateTime

Date
-----
The Date class is the first that we will use that is not loaded by default in Ruby. There are many classes that are not part of the core language. To use these methods we need to use `require "date"` in any scripts or irb.

The Date class create objects that represent any date, in the past, present, or future.

```ruby
require 'date'

date = Date.new(2014, 9, 6) # YYYY, MM, DD
date.day   = 6
date.month = 9
date.year  = 2014

date + 1 # => the next day

date.leap? # => true or false for leap year
date.monday? # => false
```

`DateTime` inherits from `Date`, which means it has all of the same methods as date, but includes methods to handle a time in a date as well

```ruby
require "date"

datetime = DateTime.now
datetime.zone # => "-07:00"
datetime.hour # => 20
datetime.minute # => 47

datetime - (365 * 10) # => 10 years ago, except 2 leap days :(
```
