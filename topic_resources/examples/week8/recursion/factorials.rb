def factorial(num = 0)
  return "Can not calculate factorial of a negative number" if num < 0

  if num <= 1
    1
  else
    num * factorial(num - 1)
  end
end



