class GamePlay

  def initialize(position = Map.random_room, rubies = 0, spawn = Map.spawn_away_from(position), grue_sleep_count = 1)
    @player = Player.new(position, rubies)
    @exit = position
    @grue = Grue.new(spawn, grue_sleep_count)
  end

  def position
    @player.room_name
  end

  def grue_asleep?
    @grue.asleep?
  end

  def exit
    Map.name_of_room(@exit)
  end

  def door_available?(direction)
    @player.door_available?(direction)
  end

  def move(direction)
    @grue.sleep_turn
    @player.move(direction)
  end

  def sufficient_rubies?
    @player.sufficient_rubies?
  end

  def num_of_rubies
    @player.rubies
  end

  def grue_find_player
    @grue.move_to(@player.position)
  end

  def grue_in_room?
    @grue.found_player?(@player.position)
  end

  def grue_flee_room #TODO some grue runtime logic
    @player.collect_ruby
    @grue.flee_room
  end

  def win?
    @player.position == @exit && @player.sufficient_rubies?
  end

  def gameover?
    grue_in_room? || win?
  end
end
