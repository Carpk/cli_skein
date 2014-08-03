class Grue

  def initialize(position, sleep_count = 0)
    @position = position
    @sleep_count
  end

  def move_to(player)
    @position = Compass.move_to_target(@position, player)
  end

  def found_player?(player)
    @position == player
  end

  def flee_room
    next_direction = Map.cardinal_exits(@position).sample
    @position = Map.next_room(@position, next_direction)
  end
end
