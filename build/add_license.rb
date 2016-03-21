#!/usr/bin/env ruby
require 'pathname'

file = Pathname.new ARGV[0]
license_file = Pathname.new ARGV[1]

inserted = false
File.open(file).each do |line|
  puts line
  if line.include? "<?php" and !inserted
    inserted = true
    puts File.open(license_file, "rb") { |io| io.read }
    puts ""
  end
end

