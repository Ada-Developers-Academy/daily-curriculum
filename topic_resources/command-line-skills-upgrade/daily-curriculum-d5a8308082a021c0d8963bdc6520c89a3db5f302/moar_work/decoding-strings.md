# Decoding a cryptic String

Create a class that can decode the cryptic string below using the following table:

```ruby
'Hello%20%22World%22%20%2D%201%20is%20%3E0%2E'
# => 'Hello "World" - 1 is > 0.'
```


| Symbol              | Code                       |
|:-----------------:|:----------------------------|
| " " (space)  | %20 |
| """ (double quote)  | %22 |
| "%" (percent)  | %25 |
| "-" (hyphen)  | %2D |
| "." (period)  | %2E |
| "<" (less than)  | %3C |
| ">" (greater than)  | %3E |
| "\" (backslash)  | %5C |
| "_" (underscore)  | %5F |


Silver
------

Add a method to encode a normal string using all of symbols in the table.
