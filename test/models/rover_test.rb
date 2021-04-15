require 'minitest/autorun'
require_relative '../../models/rover'

class RoverTest < Minitest::Test
  describe 'move in right direction' do
    it 'should move up' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'N')
      rover.move
      assert_equal({ coordinate_x: 2, coordinate_y: 3 }, rover.coordenates)
    end

    it 'should move down' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'S')
      rover.move
      assert_equal({ coordinate_x: 2, coordinate_y: 1 }, rover.coordenates)
    end

    it 'should move right' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'E')
      rover.move
      assert_equal({ coordinate_x: 3, coordinate_y: 2 }, rover.coordenates)
    end

    it 'should move left' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'W')
      rover.move
      assert_equal({ coordinate_x: 1, coordinate_y: 2 }, rover.coordenates)
    end
  end

  describe 'set right direction' do
    it 'should turn from north' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'N')
      rover.rotate(instruction: 'L')
      assert_equal 'W', rover.orientation
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'N')
      rover.rotate(instruction: 'R')
      assert_equal 'E', rover.orientation
    end

    it 'should turn from east' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'E')
      rover.rotate(instruction: 'L')
      assert_equal 'N', rover.orientation
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'E')
      rover.rotate(instruction: 'R')
      assert_equal 'S', rover.orientation
    end

    it 'should turn from south' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'S')
      rover.rotate(instruction: 'L')
      assert_equal 'E', rover.orientation
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'S')
      rover.rotate(instruction: 'R')
      assert_equal 'W', rover.orientation
    end

    it 'should turn from west' do
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'W')
      rover.rotate(instruction: 'L')
      assert_equal 'S', rover.orientation
      rover = Rover.new(coordinate_x: 2, coordinate_y: 2, orientation: 'W')
      rover.rotate(instruction: 'R')
      assert_equal 'N', rover.orientation
    end
  end
end
