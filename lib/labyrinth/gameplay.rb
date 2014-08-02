class GamePlay
  attr_reader :rubies

  def initialize(position = Map.random_room)
    @position = position
    @exit = position
    @grue = spawn_grue
    @rubies = 0
  end

  def position
    Map.name_of_room(@position)
  end

  def exit
    Map.name_of_room(@exit)
  end

  def door_available?(direction)
    available_doors = Map.cardinal_exits(@position)
    available_doors.include?(direction)
  end

  def move(direction)
    @position = Map.next_room(@position, direction)
  end

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

  def win?
    @position == @exit && rubies >= 5
  end

  def gameover?
    grue_in_room? || win?
  end
end
