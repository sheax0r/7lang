#!/usr/bin/env io
# Day 2, Question 8
Range

# Generate a random number
number := (Random value(99) +1) floor()

# Ask the user to guess the number 10x.
success := false
1 to(10) foreach(i,
  i print 
  ": Guess the number: " println
  guess := File standardInput readLine asNumber
  if( guess == number) then(
    success := true
    break
  ) elseif(guess < number) then(
    "Warmer" println
  ) else(
    "Colder" println
  )
)

if(success) then(
    "You got it!" println
) else( 
  "You shall never rise from the ashes of your shame and humiliation!" println
)
