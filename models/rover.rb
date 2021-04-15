# frozen_string_literal: true

# Rovers are robots sended to mars from the NASA to explore and take pictures
class Rover
  attr_reader :coordinate_x, :coordinate_y, :orientation, :broken

  def initialize(coordinate_x:, coordinate_y:, orientation:)
    @coordinate_x = coordinate_x
    @coordinate_y = coordinate_y
    @orientation = orientation
    @broken = false
  end

  def move
    calculate_move = move_instruction[orientation]
    x, y = calculate_move.call(coordinate_x, coordinate_y)
    @coordinate_x = x
    @coordinate_y = y
  end

  def broke
    @broken = true
  end

  def rotate(instruction:)
    @orientation = calculate_orientation[orientation][instruction]
  end

  def position
    return 'this rover has fallen off the plateau 💥' if @broken

    "#{@coordinate_x} #{@coordinate_y} #{@orientation}"
  end

  def coordenates
    { coordinate_x: @coordinate_x, coordinate_y: @coordinate_y }
  end

  private

  def calculate_orientation
    @calculate_orientation ||= {
      'N' => { 'L' => 'W', 'R' => 'E' },
      'E' => { 'L' => 'N', 'R' => 'S' },
      'S' => { 'L' => 'E', 'R' => 'W' },
      'W' => { 'L' => 'S', 'R' => 'N' }
    }
  end

  def move_instruction
    {
      'N' => ->(x, y) { [x, y + 1] },
      'E' => ->(x, y) { [x + 1, y] },
      'S' => ->(x, y) { [x, y - 1] },
      'W' => ->(x, y) { [x - 1, y] }
    }
  end
end
