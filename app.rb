# frozen_string_literal: true
require './models/rover'
require './models/plateau'

instructions = File.readlines(ARGV[0]).map { |line| line.gsub("\n", '') }
pp instructions
