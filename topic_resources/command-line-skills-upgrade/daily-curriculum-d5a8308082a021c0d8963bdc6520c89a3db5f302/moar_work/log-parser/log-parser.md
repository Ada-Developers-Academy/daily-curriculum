Log Parser
----------

Build a class that can take the output of a Rails log produce analytics on the data.
Use the sample file `sample.log` within this directory.

Bronze
------
Write a method that returns the total number of requests from the entire data set. Each single request in the log file will look something like:

```
Started GET "/posts/new" for 127.0.0.1 at 2014-10-23 08:37:58 -0700
Processing by PostsController#new as HTML
  User Load (0.3ms)  SELECT  "users".* FROM "users"   ORDER BY "users"."id" DESC LIMIT 1
  Rendered shared/_error_messages.html.erb (0.0ms)
  Rendered posts/new.html.erb within layouts/application (2.5ms)
Completed 200 OK in 51ms (Views: 48.7ms | ActiveRecord: 0.3ms)
```

The request starts with `Started` and ends with `Completed`, followed by two  line breaks.

Silver
-------
Parse how many requests happen each second. Store the result in a hash where the
datetime (in seconds) is the key and the number of total requests during that second
is the value.

Example:
```ruby
{1414078678=>1, 1414078679=>21, 1414078680=>16, 1414078681=>17, 1414078682=>16, 1414078683=>17, 1414078684=>16, 1414078685=>17}
```

Gold
------
Parse how many requests happen each minute. Format the key to be a human readable string to represent the time with minutes.


```ruby
{"2014-10-13-9:03"=>1, "2014-10-13-9:04"=>21, "2014-10-13-9:05"=>16}
```

Platinum
-----
Break down each minutes requests by path.

Example:
```ruby
{"2014-10-13-9:03"=> {"/posts" => 1, "/posts/new" => 5}, "2014-10-13-9:04"=> {"/posts" => 1, "/posts/9/edit" => 5}, "2014-10-13-9:05"=> {"/posts/new" => 1, "" => 5}}
```

Diamond
--------

Create a new class that represents each inner key/value `"2014-10-13-9:03"=> {"/posts" => 1, "/posts/new" => 5}`.

The class should have the attributes

- time
- path
- count
