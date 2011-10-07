#!/usr/bin/env ruby

require 'shell-tools'

COUNT = 10
puts "hello, putr test"
1.upto(COUNT) do |i|
  putr "#{i} of #{COUNT}"
  STDOUT.flush
  sleep 1
end
puts " done"