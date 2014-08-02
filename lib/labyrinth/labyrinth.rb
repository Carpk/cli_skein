class Labyrinth

  def initialize
    @game = GamePlay.new
    @view = DisplayUtility.new(@game.exit)
  end

  def play
    turn = 0
    until @game.gameover?
      if turn < 5
        player_move
        turn += 1
      else
        rest_move
        turn = 0
      end
    end
    end_game
  end

  def player_move
    direction = @view.choose_direction(@game.position).to_sym

    until @game.door_available?(direction)
      @view.no_door
      direction = @view.choose_direction(@game.position).to_sym
    end
    take_turn(direction)
  end

  def rest_move
    @view.rest
    sleep(2)
    @game.grue_find_player
  end

  def take_turn(direction)
    @view.clear_screen
    @view.move_to_top
    @game.move(direction)
    if @game.grue_in_room?
      @game.grue_random_move
      @view.grue_flee(@game.rubies)
    end
      @view.prompt_exit(@game.rubies, @game.exit) if @game.rubies >= 5
  end

  def end_game
    if @game.win?
      @view.gameover_win
    elsif @game.grue_in_room?
      @view.gameover_lose
    end
  end

end