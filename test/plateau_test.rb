require 'minitest/autorun'
require_relative '../models/plateau'
require_relative '../models/rover'

class PlateauTest < Minitest::Test
  describe 'getting right dimensions' do
    def setup
      @plateau = Plateau.new(coordinate_x: 8, coordinate_y: 5)
    end

    it 'should return false from rovers outside' do
      rover = Rover.new(coordinate_x: 10, coordinate_y: 10, orientation: 'N')
      refute @plateau.inside_of_limits?(**rover.coordenates)
    end

    it 'should return true form rovers inside' do
      rover = Rover.new(coordinate_x: 5, coordinate_y: 5, orientation: 'N')
      assert @plateau.inside_of_limits?(**rover.coordenates)
    end
  end
end
