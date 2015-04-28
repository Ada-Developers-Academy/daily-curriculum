!SLIDE text-size-90 transition=fade

SQLite
===

## Inserting a record

```sql
sqlite> INSERT INTO posts (title, body) VALUES ('hello', 'world');
sqlite> .headers on
sqlite> .mode tabs
sqlite> SELECT * FROM posts;
id      title   body
1       hello   world
```

