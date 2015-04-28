- Grab content of raw github url for week (https://raw.githubusercontent.com/Ada-Developers-Academy/daily-curriculum/master/week01/weekly_overview.md)
- Separate each weekday by name.
- Create a Hash with each day name as a key.
- Create an Array for each day containing a Hash for each row.
- Strip out any markdown syntax (**, [link](links))

```ruby
{tuesday: [
  {time: "9:00 - 10:00", topic: "Rails"},
  {time: "9:00 - 10:00", topic: "Rails"},
  {time: "9:00 - 10:00", topic: "Rails"},
  {time: "9:00 - 10:00", topic: "Rails"},
  {time: "9:00 - 10:00", topic: "Rails"},
]}
```

- Write a script that finds the current week/day and returns that hash
