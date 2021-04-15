# frozen_string_literal: true

# the plateau is the terrain where the rovers move to fulfill their mission
class Plateau
  def initialize(coordinate_x:, coordinate_y:)
    @coordinate_x = coordinate_x
    @coordinate_y = coordinate_y
  end

  def inside_of_limits?(coordinate_x:, coordinate_y:)
    (0..@coordinate_x).include?(coordinate_x) && (0..@coordinate_y).include?(coordinate_y)
  end
end
