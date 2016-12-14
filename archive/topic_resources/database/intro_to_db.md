# Introduction to databases

## What is persistence?
As defined by wikipedia:
  >persistence refers to the characteristic of state that outlives the process that created it

## What is a database?
The thing you keep your data in... or, an organized collection of data.

### Several popular paradigms:
- Relational (RDB)
- Document
- Key-Value
- Object
- Graph, etc.

### RDB
A relational database consists of structured data, organized in tables. These tables have relationships with one another and are formally described. Data is stored in rows and columns.

**Schema** – A representation of the structure of a database. It may be graphical or textual.

**Table** – A collection of closely related columns. A table consists of rows each of which shares the same columns but vary in the column values.

**Column** – A single unit of named data that has a particular data type. Columns only exist in tables.

**Row** – One set of related values for all of the columns declared in a given table. Also known as a record.

**Primary Key** – A column or group of columns in a given table that uniquely identify each row of the table.

**Foreign Key** – One or more columns in a table intended to contain only values that match the related primary/unique key column(s) in the referenced table.


## What is SQL?

### Structured Query Language
The language of relational databases.

SQL Statements are divided into two primary categories:
- DDL: Data Definition Language
  - Create, Drop, Alter, etc.
- DML: Data Manipulation Language
  - Select, Insert, Update, Delete, etc.
