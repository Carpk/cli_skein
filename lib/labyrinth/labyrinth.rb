class Labyrinth

  def initialize
    @game = GamePlay.new
    @view = DisplayUtility.new(@game.exit)
  end

  def play
    grue_sleep_counter = 0
    until @game.gameover?
      if grue_sleep_counter < 5
        player_move
        grue_sleep_counter += 1
      else
        rest_move
        grue_sleep_counter = 0
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
    check_for_grue
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

    if @game.rubies >= 5
      @view.prompt_exit(@game.rubies, @game.exit)
    end
  end

  def check_for_grue
    if @game.grue_in_room?
      @game.grue_random_move
      @view.grue_flee(@game.rubies)
    end
  end

  def end_game
    if @game.win?
      @view.gameover_win
    elsif @game.grue_in_room?
      @view.gameover_lose
    end
  end

end
