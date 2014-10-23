Log Parser
----------

Build a class that can take the output of a Rails log produce analytics on the data.
Use the sample file `sample.log` within this directory.

Bronze
-------
Parse how many requests happen each second. Store the result in a hash where the
datetime (in seconds) is the key and the number of total requests during that second
is the value.

Example:
```ruby
{1414078678=>1, 1414078679=>21, 1414078680=>16, 1414078681=>17, 1414078682=>16, 1414078683=>17, 1414078684=>16, 1414078685=>17}
```

Silver
------
Parse how many requests happen each minute. Format the key to be a human readable string to represent the time with minutes.


```ruby
{"2014-10-13-9:03"=>1, "2014-10-13-9:04"=>21, "2014-10-13-9:05"=>16}
```

Gold
-----
Break down each minutes requests by path.

Example:
```ruby
{"2014-10-13-9:03"=> {"/posts" => 1, "/posts/new" => 5}, "2014-10-13-9:04"=> {"/posts" => 1, "/posts/9/edit" => 5}, "2014-10-13-9:05"=> {"/posts/new" => 1, "" => 5}}
```

Platinum
--------

Create a new class that represents each inner key/value `"2014-10-13-9:03"=> {"/posts" => 1, "/posts/new" => 5}`.
