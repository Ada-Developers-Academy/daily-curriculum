# Orange Tree

## Breakfast (from L2P)
Make an `OrangeTree` class. It should have a `height` method which returns its height, and a  `one_year_passes` method, which, when called, ages the tree one year. Each year the tree grows taller (however much you think an orange tree should grow in a year), and after some number of years (again, your call) the tree should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than younger trees... whatever you think makes most sense. And, of course, you should be able to `count_the_oranges` (which returns the number of oranges on the tree), and `pick_an_orange` (which reduces the `@orange_count` by one and returns a string telling you how delicious the orange was, or else it just tells you that there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.

## Lunch
Make an `OrangeGrove` class that holds many `OrangeTree` objects. When one year passes all trees should progress a year. You should have a `count_all_the_oranges` method which returns the total number of oranges on all trees.

## Dinner
Add a `@soil_quality` attribute to your `OrangeGrove`. More trees in the grove will lower the soil quality over time, which impacts the longevity of the trees, and the amount of fruit each tree produces. Fewer trees in a grove will increase the `@soil_quality` as years pass.

Also create a `plant_on(grove)` method for the `OrangeTree` class which adds a new tree to the grove.


## Dessert nom nom nom
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

### [Rubric](../rubrics/week_2_orangetree.md)
