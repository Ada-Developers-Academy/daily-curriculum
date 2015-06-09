!SLIDE text-size-90 transition=fade

SQLite
===

## Creating a table

```sql
sqlite> CREATE TABLE posts (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL
);
```
## Each column has a type (integer, text...) and optionally constraints (primary/unique key, default value, not null...)
