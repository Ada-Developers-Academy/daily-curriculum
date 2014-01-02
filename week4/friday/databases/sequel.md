!SLIDE text-size-90 transition=fade

The Sequel Gem
===

http://rubygems.org/gems/sequel

http://sequel.jeremyevans.net/

## Extremely flexible database client abstraction

```bash
$ irb
2.0.0p247 :001 > require 'sequel'
 => true
2.0.0p247 :002 > db = Sequel.sqlite
 => #<Sequel::SQLite::Database: {:adapter=>:sqlite}>
2.0.0p247 :003 > db.create_table(:posts){ primary_key :id; string :title; string :body }
 => nil
2.0.0p247 :004 > posts = db[:posts]
 => #<Sequel::SQLite::Dataset: "SELECT * FROM `posts`">
2.0.0p247 :005 >
```

