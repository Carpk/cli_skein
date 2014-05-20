
class LabyrinthController

  def initialize
    @data = LabyrinthModel.new
    @view = LabyrinthView.new(@data.exit)
  end

  def play
    turn = 0
    while @data.progress
      if turn >= 5
        turn = 0
        rest_move
      else
        turn += player_move
      end
      end_game?
    end
  end

  def rest_move
    @view.rest
    sleep(2)
    @data.grue_find_player
  end

  def player_move
    direction = @view.choose_direction(@data.position)
    if @data.no_door?(direction)
      @view.no_door
      0
    else
      take_turn(direction)
      1
    end
  end

  def take_turn(direction)
    @view.clear_screen
    @view.move_to_top
    @data.move(direction)
    if @data.grue_local?
      @data.grue_random_move
      @view.grue_flee(@data.rubies)
    end
      @view.prompt_exit(@data.rubies, @data.exit) if @data.rubies >= 5
  end

  def end_game?
    if @data.win?
      @view.gameover_win
    elsif @data.grue_local?
      @view.gameover_lose
    end
  end

end