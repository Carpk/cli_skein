class Labyrinth

  def initialize
    @game = LabyrinthModel.new
    @view = DisplayUtility.new(@game.exit)
  end

  def play
    turn = 0
    while @game.progress
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
    @game.grue_find_player
  end

  def player_move
    direction = @view.choose_direction(@game.position)
    if @game.no_door?(direction)
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
    @game.move(direction)
    if @game.grue_local?
      @game.grue_random_move
      @view.grue_flee(@game.rubies)
    end
      @view.prompt_exit(@game.rubies, @game.exit) if @game.rubies >= 5
  end

  def end_game?
    if @game.win?
      @view.gameover_win
    elsif @game.grue_local?
      @view.gameover_lose
    end
  end

end