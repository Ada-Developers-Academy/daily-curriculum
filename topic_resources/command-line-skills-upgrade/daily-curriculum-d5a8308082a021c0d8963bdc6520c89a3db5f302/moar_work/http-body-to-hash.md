Create an `Http` class to convert the following string into a `Hash` with the given rules.

Bronze
-------

```ruby
"market[name]=Cap Hill Market&market[description]=A good place to buy produce"
```

1. Separate each element on the `&` characters.
2. Separate key and value on the `=` character
2. `[*]` indicates a hash as a value, the word preceding the `[*]` is the key to the value and the word in the `[*]` is a key within the nested hash.

Example:

```ruby
{market: {name: "Cap Hill Market", description: "A good place to buy produce"}}
```
Silver
-------

```ruby
"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce"
```

1. Rules from Bronze
2. Convert `%20` into a space character


Gold
-------
Create a nested hash by separating the following into hashes

```ruby
"market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce&market[vendors_attributes][][name]=Jules%20Produce"
```

1. Rules from Bronze and Silver
2. An empty `[]` indicates an Array as a value. the word preceding the `[]` is the key to the Array the word after the `=` will be added to the array.

Platinum
-----

```bash
GET /markets HTTP/1.1
User-Agent: curl/7.30.0
Host: localhost:3000
Content-Length: 141
Accept: */*

market[name]=Cap%20Hill%20Market&market[description]=A%20good%20place%20to%20buy%20produce&market[vendors_attributes][][name]=Jules%20Produce
```

1. Rules from Bronze, Silver, and Gold
2. Seperate and parse the hash from the rest of the HTTP text
3. Add additional attributes of `method` and `path` to the class and parse those out of the request ("GET" & "/markets")
