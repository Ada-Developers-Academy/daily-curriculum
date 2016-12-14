# More Enumberables

## Hashes
### Enumerable methods shared with arrays
Some of the enumerable methods we've seen used with arrays can also be used on hashes. Because a hash is a data structure with multiple pairs (key and value), when we iterate over it using our enumerable methods, we write the `do end` block to take multiple parameters:

```ruby
h = {
  first_key: "first_value",
  second_key: "second_value"
}

h.each do |key, value|
  puts "The key is #{key} and the value is #{value}."
end
```

This outputs:
```
The key is first_key and the value is first_value.
The key is second_key and the value is second_value.
```


We can also use the `map`, `find`, and `find_all` enumerable methods in a similar fashion.


### Accessing keys and values
Sometimes what we want to get from our hash is just the set of keys, or just the list of values. This can be accomplished with the `keys` and `values` methods, respectively.
