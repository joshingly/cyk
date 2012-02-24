#!/usr/bin/env ruby

require_relative 'lib/cyk'

puts Cyk.can_generate('abc', 'files/sample-input1.txt')
