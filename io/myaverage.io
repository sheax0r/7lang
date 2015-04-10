#!/usr/bin/env io
List myAverage := method(
  (self sum) / (self size)
)

# Prints 2
(list(1,2,3) myAverage) println

# Raises "nil does not respond to '/'
(list myAverage) println
