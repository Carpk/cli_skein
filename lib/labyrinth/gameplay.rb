class GamePlay
  attr_reader :rubies

  def initialize(position = Map.random_room, spawn = Map.spawn_away_from(position))
    # @player = position
    @player = Player.new(position)
    @exit = position
    @grue = Grue.new(spawn)
    @rubies = 0
  end

  def position
    @player.room_name
  end

  def exit
    Map.name_of_room(@exit)
  end

  def door_available?(direction)
    @player.door_available?(direction)
  end

  def move(direction)
    @player.move(direction)
  end

  def grue_find_player
    @grue.move_to(@player.position)
  end

  def grue_in_room?
    @grue.found_player?(@player.position)
  end

  def grue_flee_room #TODO
    @rubies += 1
    @grue.flee_room
  end

  def win?
    @player.position == @exit && rubies >= 5
  end

  def gameover?
    grue_in_room? || win?
  end
end
