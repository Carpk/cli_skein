class Grue

  def grue_find_player
    @grue = Compass.move_to_target(@grue, @position)
  end

  def grue_in_room?
    @grue == @position
  end

  def grue_random_move
    @rubies += 1
    next_direction = Map.cardinal_exits(@grue).sample
    @grue = Map.next_room(@grue, next_direction)
  end

  def spawn_grue
    possible_spawn = Map.random_room
    if Compass.find_target(possible_spawn, @position).length > 3
      possible_spawn
    else
      spawn_grue
    end
  end
end
