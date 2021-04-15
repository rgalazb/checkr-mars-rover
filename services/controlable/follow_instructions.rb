# frozen_string_literal: true

module Controlable
  # command to make any kind of vehicle follow the given instructions
  # returns the final position of the vehicle.
  class FollowInstructions
    def self.call(vehicle:, instructions:, surface:)
      instructions.map do |command|
        next if vehicle.broken

        action = choose_command[command]
        action.call(vehicle)
        vehicle.broke unless surface.inside_of_limits?(**vehicle.coordenates)
      end
      vehicle.position
    end

    private_class_method def self.choose_command
      rotate = ->(rover, instruction) { rover.rotate(instruction: instruction) }
      curried_rotate = rotate.curry
      {
        'M' => ->(rover) { rover.move },
        'L' => ->(rover) { curried_rotate.call(rover).call('L') },
        'R' => ->(rover) { curried_rotate.call(rover).call('R') }
      }
    end
  end
end
