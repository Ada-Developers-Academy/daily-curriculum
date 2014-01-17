# CSV as a Database (DB)

A database is a system of storing and organizing information on a computer. In this case a CSV will act as our database. In most cases a database can be thought of as a table or group of tables:

| ID | Name    |
|:---|:--------|
| 1  | Kerri   |
| 2  | Bookis  |
| 3  | Cheri   |
| 4  | Elise   |

Ruby includes a CSV library used to read and write CSV files.

    require 'csv'
    # Reads the contents of the file into an array of arrays.
    CSV.read("markets.csv")
    # => [["1", "Kerri"],["2", "Bookis"],["3", "Cheri"],["4", "Elise"]]

    # Returns a CSV Object, to be read or manipulated.
    csv = CSV.open("markets.csv")
    # <#CSV io_type:File io_path:"file.csv" encoding:UTF-8 ...> 

The `open` method require at least one argument and up to three arguments as well as an optional block. 

    .open(filename, mode='r', options) {|file| block}
    
The required argument is the filename, the second argument ('mode') is the permissions that are allowed when the file is opened, this defaults to "r" (read), possible values are: 

|Mode |  Meaning
|:---:|---------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode) |
|"r+" |  Read-write, starts at beginning of file.               |
|"w"  |  Write-only, truncates existing file to zero length     |
|"w+" |  Read-write, truncates existing file to zero length.    |
|"a"  |  Write-only, starts at end of file if file exists.      |
|"a+" |  Read-write, starts at end of file if file exists.      |
| "b" |  Binary file mode                                       |
| "t" |  Text file mode                                         |

Most modes will create a new file if one doesn't already exist with the given name.

The block is too manipulate the file upon opening it and close the file after completing the code within the block:

    require 'csv'
    CSV.open("some_new_file.csv", 'w') do |csv|
      csv << ["some data"]
    end

We can iterate over each line of the file using the `each` method:

    require 'csv'
    CSV.open("markets.csv", 'r').each do |line|
      puts line.inspect
    end

The `.read` method requires one arguement, the filename, and allows for additional options.

    require 'csv'
    array_of_markets = CSV.read("markets.csv")
    # => [["1", "Market 1"], [2, "Market 2"], [...]]
    
`.read` reads the contents of the CSV and creates an `Array` for each row of data.