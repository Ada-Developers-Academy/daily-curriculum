# Complexity and Benchmarking

## Benchmark

Some ways of writing our code are slower than others. Ruby has a built
in library called 'benchmark' which can help us determine how our code
is performing.

Try the following:

```
require 'benchmark'

class MeasureMe
  def constant_time_method(n) # O(1)
    true
  end
end

a = [10, 100, 1000, 10000]
m = MeasureMe.new

Benchmark.bm do |x|
  a.each do |n|
    puts "Running #{n} iterations..."
    x.report { m.constant_time_method(n) }
  end
end
```

What is the long term behavior of this method as n gets large? Try
putting in larger numbers to see what happens.

Next, add the following method to MeasureMe and to your benchmark:

```
  def linear_time_method(n) # O(n)
    n.times { |i| constant_time_method(1) }
  end
```

How do the results constant_time_method and linear_time_method diverge as n gets large?

Add one more (much slower) method and measure its performance:

```
  def quadratic_time_method(n) # O(n^2)
    n.times do |i|
      n.times do |j|
        constant_time_method(1)
      end
    end
  end
```

## Moar

* Benchmark and compare (linear_time_method(n) +
  linear_time_method(n)) to both linear_time_method(n) and
  quadratic_time_method(n). How do they diverge as n goes from 10, 100, 500, 1000?

* Do the same with (linear_time_method(n) + quadratic_time_method(n))
  and (quadratic_time_method(n) + quadratic_time_method(n))
  vs. quadratic_time_method(n). For what n do they start to get too
  slow?

* Find the Grapher App on your Mac. Take a look at the following
  graphs: y = x, y = 5x + 10, y = x^2, y = 0.2 x^2, y = x *
  log(x). How do they compare for x near zero? Large x?

* Find some code in your homework that ran slow. Benchmark it. Is
  there quadratic code (nested loops) that you can write some other
  way? If so, try to re-write it to improve the benchmark scores.


