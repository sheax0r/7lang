#!/usr/bin/env io
Range

Builder := Object clone

Builder indentation := 0

Builder indent := method(
  result := ""
  for(i,0,indentation,
      result := result .. "  "
    )
  result
)

Builder forward := method( 
  writeln("#{indent}<#{call message name}>" interpolate)
  indentation = indentation + 1
  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Sequence", 
      writeln(indent, content)
    )
  )
  indentation = indentation - 1
  writeln("#{indent}</#{call message name}>" interpolate)
)

