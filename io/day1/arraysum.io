#!/usr/bin/env io
# Day 2, Question 3
arraysum := method(lists,
  result := 0
  lists foreach(current, 
    result = result + current sum
  )
  result
)

test := list(
  list(1,2,3),
  list(4,5,6)
)

arraysum(test) println

