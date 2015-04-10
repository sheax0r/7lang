#!/usr/bin/env io
# Day 2, Question 2
orig_div := Number getSlot("/")
Number / := method(num, 
  if(num != 0, self orig_div(num), 0)
)

# Tests
(2/0) println
(2/1) println
(3/2) println

