!SLIDE title-and-content transition=fade

Let's Talk About Objects!
=========================

In Ruby, everything is an Object.

```
"foo".class
 => String
 4.class
 => Fixnum
 [1,2,3].class
 => Array
 ```
!SLIDE text-size-90 title-and-content transition=fade

What's isn't an Object?
=======================

1. Gather ingredients -- 1c flour, 1c butter, 1c sugar, 2 eggs
2. Preheat oven to 350F
3. Beat eggs and butter
4. Add flour and sugar
5. Mix
6. Bake for 10 minutes

This is just a set of instructions.


!SLIDE title-and-content transition=fade

What's an Object?
=================

An Object is a collection of data attributes and actions that are related. It is an **abstraction** that let's us deal with *concepts*.

!SLIDE transition=fade

```
class Baker
  def initialize
    @flour  = 2
    @butter = 5
    @sugar  = 3
    @eggs   = 23
  end

  def make_cookies
    heat_oven(350)
  end

  def heat_oven(temp)
  end
end
```



