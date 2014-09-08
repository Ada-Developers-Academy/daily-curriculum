## Orange Tree

Bronze (from L2P)
------
Make an `OrangeTree` class. It should have a `height` method which returns its height, and a  `one_year_passes` method, which, when called, ages the tree one year. Each year the tree grows taller (however much you think an orange tree should grow in a year), and after some number of years (again, your call) the tree should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than younger trees... whatever you think makes most sense. And, of course, you should be able to `count_the_oranges` (which returns the number of oranges on the tree), and `pickAnOrange` (which reduces the `@orangeCount` by one and returns a string telling you how delicious the orange was, or else it just tells you that there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.

Silver
------
Make an `OrangeGrove` class that holds many `OrangeTree` objects. When one year passes all trees should progress a year. You should have a `count_all_the_oranges` method which returns the total number of oranges on all trees.

Gold
-----
The `OrangeGrove` should also have a `@soil_quality` attribute, the more trees in the grove the lower this number is, but a lower number also produces longer living trees that produce more fruit.

Also create a `self.plant_on(grove)` method which adds a new tree to the grove passed in as an argument.

Depending on the soil quality any new tree on the grove has a chance of being dead.

Platinum
--------
Create a Ascii-text based tree program which shows a map of the grove that changes with each passing year.

```
---------------------
   0      6      1
.._!_....<|>....<|>..
---------------------
   1      9      2
.._l_....<|>....<|>..
---------------------
   8      2      2
..<|>....<|>....<|>..
---------------------
```

#### Trees
- `_!_` = Dead
- `_l_` = 1 year from birth or death
- `<|>` = Healthy

#### Soil

- `_` = Unhealthy
- `.` = Average
- `,` = Healthy

p.s. Google is your friend.
