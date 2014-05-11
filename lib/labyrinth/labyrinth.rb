
class LabyrinthController

  def initialize
    @data = LabyrinthModel.new
    @view = LabyrinthView.new(@data.exit)
  end

  def play
    turn = 0
    while @data.progress
      direction = @view.choose_room(@data.position)
      if @data.no_door?(direction)
        @view.no_door
      else
        turn += 1
        take_turn(direction)
      end
      turn = rest if turn >= 3
    end
  end

  def take_turn(direction)
    @view.clear_screen
    @data.move(direction)
    if @data.grue_local?
      @data.grue_random_move
      @view.grue_flee(@data.rubies)
      @view.find_exit(@data.rubies, @data.exit) if @data.rubies >= 5
    end
  end

  def rest               # grue does not kill you in Oche room!
    @view.rest
    if @data.grue_find_player
      @view.gameover_lose
    end
    sleep(3)
    0
  end

end