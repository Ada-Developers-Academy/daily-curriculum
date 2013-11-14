## Enumerable

Enumerable operates at it's core using the `each` method. When you call `map`, `map` is using `each`.

#### map & collect

    [1,2,3].map { |n| n ** 2 }
    [1,2,3].collect { |n| n ** 2 }
    # => [1, 4, 9]
    
#### sort & sort_by

    [1,3,6,3,2,346,6,7].sort
    # => [1, 2, 3, 3, 6, 6, 7, 346] 

    alphabetical_products = Product.all.sort_by {|product| product.name }
    alphabetical_products.first
    # => #<Product:0x007fc599d8f390 @id=5943, @name="Afraid Apples", @vendor_id=1958> 
    
#### min, max, min_by, & max_by

    [1,2,4].max
    # => 4
    [1,2,4].min
    # => 1
    Sale.all.min_by { |sale| sale.amount }
    Sale.all.max_by { |sale| sale.amount }
    
#### first(n)
    
    Sale.all.sort_by { |sale| sale.amount }.first(5)
    # Returns the 5 sales with the lowest amount
    
#### group_by

    Product.all.group_by {|product| product.name.split.last }
    # Returns a hash, the keys being the name of the food type, the values being an array of products.