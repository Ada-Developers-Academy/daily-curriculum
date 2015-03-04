!SLIDE text-size-90 transition=fade

SQLite
===

## Datasets

It's all Ruby now. Let's do our DML now...

```bash
2.0.0p247 :005 > posts.insert(title: 'hello', body: 'world')
 => 1
2.0.0p247 :006 > posts.all
 => [{:id=>1, :title=>"hello", :body=>"world"}]
2.0.0p247 :007 > posts.where(id: 1).update(title: 'goodbye')
 => 1
2.0.0p247 :008 > posts.all
 => [{:id=>1, :title=>"goodbye", :body=>"world"}]
2.0.0p247 :009 > posts.where(id: 1).delete
 => 1
2.0.0p247 :010 > posts.all
 => []
```
