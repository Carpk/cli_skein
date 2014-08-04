class Labyrinth

  def initialize
    @game = GamePlay.new
    @view = DisplayUtility.new(@game.exit)
  end

  def play
    until @game.gameover?
      if @game.grue_asleep?

        direction = valid_player_input
        move_player(direction)

        rubies_check
        check_room_for_grue
      else
        @view.rest
        sleep(2)
        @game.grue_find_player
      end
    end
    final_prompts
  end

  def valid_player_input
    direction = @view.choose_direction(@game.position).to_sym

    until @game.door_available?(direction)
      @view.no_door
      direction = @view.choose_direction(@game.position).to_sym
    end
  end

  def move_player(direction)
    @view.clear_screen
    @view.move_cursor_to_top

    @game.move(direction)
  end

  def rubies_check
    if @game.sufficient_rubies?
      @view.prompt_exit(@game.num_of_rubies, @game.exit)
    end
  end

  def check_room_for_grue
    if @game.grue_in_room?
      @game.grue_flee_room
      @view.grue_flee(@game.num_of_rubies)
    end
  end

  def final_prompts
    if @game.win?
      @view.gameover_win
    elsif @game.grue_in_room?
      @view.gameover_lose
    end
  end
end
