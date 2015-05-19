# CSV as a Database (DB)

A database is a system of storing and organizing information on a computer. In this case a CSV will act as our database. In most cases a database can be thought of as a table or group of tables:

| ID | Name    |
|:---|:--------|
| 1  | Kari    |
| 2  | Jeremy  |
| 3  | Crystal |
| 4  | Cynthia |

We're going to quickly create a CSV to read later, don't worry about this code for now, just copy and paste it. Notice that it created a file named `ada_people.csv` on your computer.
```ruby
people = [[1,"Kari"], [2, "Jeremy"], [3, "Crystal"], [4, "Cynthia"]]
CSV.open("ada_people.csv", "w") do |file|
  people.each do |person|
    file << person
  end
end
```

Ruby includes a CSV library used to read and write CSV files. This class is very similar to the `File` class, it's just specifically suited to read and write CSV files.

```ruby
require 'csv'
# Reads the contents of the file into an array of arrays.
CSV.read("ada_people.csv")
# => [["1", "Kari"],["2", "Jeremy"],["3", "Crystal"],["4", "Cynthia"]]

# Returns a CSV Object, to be read or manipulated.
csv = CSV.open("ada_people.csv")
# <#CSV io_type:File io_path:"file.csv" encoding:UTF-8 ...>
```

The `open` method requires at least one argument and up to three arguments as well as an optional block.

```ruby
CSV.open(filename, mode='r', options) {|file| block}
```

The required argument is the CSV filename and path. The second argument (`mode`) sets what permissions Ruby has to the file when it is opened. This defaults to `r` (read onle). Possible values are:

|Mode |  Meaning
|:---:|---------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode) |
|"r+" |  Read-write, starts at beginning of file.               |
|"w"  |  Write-only, truncates existing file to zero length     |
|"w+" |  Read-write, truncates existing file to zero length.    |
|"a"  |  Write-only, starts at end of file if file exists.      |
|"a+" |  Read-write, starts at end of file if file exists.      |
|"b"  |  Binary file mode                                       |
|"t"  |  Text file mode                                         |

Most modes will create a new file if one doesn't already exist with the given name.

If you pass a block to `open`, Ruby will open the file, execute the code within the block (the file contents is given to the block as a local variable), and then close the file.

```ruby
require 'csv'
CSV.open("moar_ada_peeps.csv", 'w') do |csv|
  csv << "1,Elise\n2,Karen"
end
```

We can iterate over each line of the file using the `each` method:

```ruby
require 'csv'
CSV.open("markets.csv", 'r').each do |line|
  puts line
end
```

The `.read` method requires one arguement, the filename, and allows for additional options. `.read` first opens the CSV file, then reads the contents of it into a new `Array`. Each row of CSV data is translated into an array as well.

```
# ada_peeps.csv
1,Kari
2,Jeremy
3,Cynthia
4,Crystal
```

```ruby
require 'csv'
require 'awesome_print'
array_of_ada_peeps = CSV.read("ada_peeps.csv")
ap array_of_ada_peeps
# [
#     [0] [
#         [0] 1,
#         [1] "Kari"
#     ],
#     [1] [
#         [0] 2,
#         [1] "Jeremy"
#     ],
#     [2] [
#         [0] 3,
#         [1] "Cynthia"
#     ],
#     [3] [
#         [0] 4,
#         [1] "Crystal"
#     ]
# ]
```

