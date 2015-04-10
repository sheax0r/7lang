def grep(file, regex, &block)
  File.open(file, 'r') do |f|
    index = 1
    f.each_line do |line|
      block.call(index, line) if regex =~ line
      index += 1
    end
  end
end
