#!/usr/bin/env io
Range
squareBrackets := method(
  new_list := list 
  call message arguments foreach(arg,
    new_list append(arg)
  )
  new_list 
)
