## SQLite

[SQLite](http://sqlite.org/) is a tiny relational database engine

```bash
$ sqlite3
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> select current_date;
2015-06-09
sqlite>
```

### Creating a table

```sql
sqlite> CREATE TABLE posts (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL
);
```
Each column has a **type** (integer, text...) and optionally **constraints** (primary/unique key, default value, not null...)

SQLite [Data Types](https://www.sqlite.org/datatype3.html):
Each value stored in an SQLite database (or manipulated by the database engine) has one of the following storage classes:

- **NULL**: The value is a NULL value.
- **INTEGER**: The value is a signed integer, stored in 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.
- **REAL**: The value is a floating point value, stored as an 8-byte IEEE floating point number.
- **TEXT**: The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).
- **BLOB**: The value is a blob of data, stored exactly as it was input.

### Inserting a record

```sql
sqlite> INSERT INTO posts (title, body) VALUES ('hello', 'world');
sqlite> .headers on
sqlite> .mode tabs
sqlite> SELECT * FROM posts;
id      title   body
1       hello   world
```


### Updating a record

```sql
sqlite> UPDATE posts SET title="goodbye" WHERE id = 1;
sqlite> SELECT * FROM posts;
id      title   body
1       goodbye world
```
### Deleting a record

```sql
sqlite> DELETE FROM posts WHERE id = 1;
sqlite> select * from posts;
sqlite>
```

Both **INSERT** and **UPDATE** require more caution than usual. ALWAYS be sure you're specifying your records with care!

When you're writing an **UPDATE always** specify a WHERE clause - otherwise you'll update every record in your database.
