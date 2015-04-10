#!/usr/bin/env io
# Day 2, Questions 4,5,6,7
Range

List2D := List clone

# Dim
List2D dim := method(x, y,
  self x := x
  self y := y
  1 to(x) foreach(i,
    new_list := list
    self append(new_list)
    1 to(y) foreach(j,
      new_list append(0)
    )
  )
  self
)

# Set a value
List2D set := method(x, y, v,
  (self at(x)) atPut(y, v)
)

# Get a value
List2D get := method(x,y,
  (self at(x)) at(y)
)

# Tranpose the list
List2D transpose := method(
  new_list := List2D clone
  new_list dim(self y, self x)
  0 to ((self x)-1) foreach(i,
    0 to((self y)-1) foreach(j,
      new_list set(j,i, (self get(i, j)))
    )
  )
  new_list
)

# Print method for debugging.
List2D print := method(
  self foreach(l,
    l foreach(v,
      v print
      "," print
    )
    "" println
  )
)

# Tests
list2d := List2D clone
list2d dim(3,4)
0 to(2) foreach(i,
  0 to(3) foreach(j,
    list2d set(i,j,(4*i)+j)
  )
)

# Override serialization 
List2D justSerialized := method(stream,
  stream write("List2D clone do(\n")
  stream write("  dim(\n")
  stream write(self x)
  stream write(",")
  stream write(self y)
  stream write(");\n")
  self foreach(i, list,
    list foreach(j, item,
      stream write("  set(")
      stream write(i)
      stream write(",")
      stream write(j)
      stream write(",")
      stream write(item serialized)
      stream write(");\n")
    )
  )
  stream write(");")
)

# Test get
"The value at 1,1 is " print
list2d get(1,1) println

# Test print 
"\nOriginal list:" println
list2d print

# Test transpose 
"\nTransposed list:" println
(list2d transpose) print

# Save to file, then read and print
"\nSaved and loaded list:" println
File with("/tmp/matrix.txt") open write(list2d serialized) close
list2d = doFile("/tmp/matrix.txt")
list2d print
