#!/usr/bin/env io
# Day 2, Question 1
fib := method(input,
  if(input < 2) then(
    result := input
  ) else(
    result := fib(input - 1) + fib(input - 2)
  )
  result
)

# Test.
fib(3) println
