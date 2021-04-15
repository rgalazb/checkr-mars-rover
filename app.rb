# frozen_string_literal: true
require './models/rover'
require './models/plateau'
require './services/controllable/follow_instructions'

instructions = File.readlines(ARGV[0]).map { |line| line.gsub("\n", '') }

plateau_x, plateau_y = instructions.first.split(' ').map(&:to_i)
plateau = Plateau.new(coordinate_x: plateau_x, coordinate_y: plateau_y)

final_positions = instructions[1..-1].each_slice(2).map do |intial_point, instruction|
  x, y, direction = intial_point.split(' ')
  rover_instructions = instruction.split('')

  rover = Rover.new(coordinate_x: x.to_i, coordinate_y: y.to_i, orientation: direction)
  Controllable::FollowInstructions.call(vehicle: rover, instructions: rover_instructions, surface: plateau)
end

final_positions.each do |position|
  puts position
end
