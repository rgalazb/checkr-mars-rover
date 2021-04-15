require 'minitest/autorun'
require_relative '../../../models/rover'
require_relative '../../../models/plateau'
require_relative '../../../services/controlable/follow_instructions'

module Controlable
  class FollowInstructionsTest < Minitest::Test
    describe 'follow correct instructions' do
      def setup
        @rover = Rover.new(coordinate_x: 1, coordinate_y: 2, orientation: 'N')
        @plateau = Plateau.new(coordinate_x: 5, coordinate_y: 5)
      end

      it 'should return right final  position' do
        instructions = 'LMLMLMLMM'.split('')
        result = Controlable::FollowInstructions.call(vehicle: @rover, instructions: instructions, surface: @plateau)
        assert_equal '1 3 N', result
      end

      it 'should broke the rover' do
        instructions = 'LMLMLMLMMMMMMMMMM'.split('')
        result = Controlable::FollowInstructions.call(vehicle: @rover, instructions: instructions, surface: @plateau)
        assert_equal 'this rover has fallen off the plateau 💥', result
      end
    end
  end
end
