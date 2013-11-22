!SLIDE text-size-90 transition=fade

SQLite
===

## Updating a record

```sql
sqlite> UPDATE posts SET title="goodbye" WHERE id = 1;
sqlite> SELECT * FROM posts;
id      title   body
1       goodbye world
```
