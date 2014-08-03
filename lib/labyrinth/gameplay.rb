class GamePlay
  attr_reader :rubies

  def initialize(position = Map.random_room, spawn = Map.spawn_away_from(position))
    @position = position
    @exit = position
    @grue = spawn
    @grue = Grue.new(spawn)
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

  def grue_flee_room #TODO this is my stopping point
    @rubies += 1
    @grue.random_move
  end

  def win?
    @position == @exit && rubies >= 5
  end

  def gameover?
    grue_in_room? || win?
  end
end
