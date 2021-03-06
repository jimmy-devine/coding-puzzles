#!/usr/bin/env ruby

require "./solver.rb"

lines = STDIN.read.split("\n")
length = lines.shift.to_i

length.times do |i|
  line = lines.shift
  value = Solver.last_tidy_number(line)
  puts "Case \##{i + 1}: #{value}"
end
