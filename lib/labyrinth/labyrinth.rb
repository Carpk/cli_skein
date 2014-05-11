
class LabyrinthController

  def initialize
    @data = LabyrinthModel.new
    @view = LabyrinthView.new(@data.exit[:name])
  end

  def play
    turn = 0
    while @data.progress
      direction = @view.choose_room(@data.position[:name])
      if @data.position[direction.to_sym] == nil
        @view.no_door
      else
        turn += 1
        take_turn(direction)
      end
      turn = rest if turn >= 5
    end
  end

  def take_turn(direction)
    @view.clear_screen
    @data.move(direction)
    if @data.grue_local?
      @view.grue_flee
      @data.grue_random_move
      @view.find_exit(@data.rubies, @data.exit[:name]) if @data.rubies >= 5
    end
  end

  def rest
    @view.rest
    if @data.grue_find_player
      @view.gameover_lose
    end
    sleep(3)
    0
  end

end