# Memoization

Memoization is an optimization technique used to store the result of expensive (slow) method calls for later re-use. This allows us to avoid repeatedly performing an expensive calculation when the result has already been calculated once.

```ruby
class EnourmousSuperComputer

  def answer_to_the_ultimate_question_of_life_the_universe_and_everything
    answer = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
    (answer * 10.5).to_i
  end

end
```
--------
```ruby
class EnourmousSuperComputer

  def answer_to_the_ultimate_question_of_life_the_universe_and_everything
    @answer ||= calculate_answer
  end

  private

  def calculate_answer
    a = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
    (a * 10.5).to_i
  end
end
```
#### Or Equal (||=)

```ruby
class EnourmousSuperComputer

  def answer_to_the_ultimate_question_of_life_the_universe_and_everything
    @answer ||= calculate_answer
  end

  def answer_to_the_ultimate_question_of_life_the_universe_and_everything
    if @answer
      @answer
    else
      @answer = calculate_answer
    end
  end

  private

  def calculate_answer
    a = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
    (a * 10.5).to_i
  end
end
```


#### When not to use memoization?

- If the result can possibly be different each time it's run.
- If the method uses instance variables that may change
- If the method takes any arguments
