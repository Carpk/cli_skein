class Grue

  def initialize(position)
    @position = position
  end

  def grue_move_to(player)
    @position = Compass.move_to_target(@position, player)
  end

  def grue_found_player?(player)
    @position == player
  end

  def grue_random_move
    next_direction = Map.cardinal_exits(@position).sample
    @position = Map.next_room(@position, next_direction)
  end

  def self.spawn_grue(ward)
    possible_spawn = Map.random_room
    if Compass.find_target(possible_spawn, ward).length > 3
      possible_spawn
    else
      spawn_grue
    end
  end

end
