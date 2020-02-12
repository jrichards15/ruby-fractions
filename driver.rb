#!/usr/imports/bin/ruby
require_relative("fractions.rb")

if ARGV.length != 2 && ARGV.length != 3
  fail "usage: driver.rb <mode> <params>"
end

if(ARGV.length == 3) then
	puts main(ARGV[0],ARGV[1],ARGV[2])
elsif(ARGV.length == 2) then
	puts main(ARGV[0],ARGV[1],nil)
end