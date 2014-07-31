class GamePlay

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

  def win?
    if @position == @exit && rubies >= 5
      @progress = false
      true
    end
  end

  def end_game?
    if @data.win?
      @view.gameover_win
    elsif @data.grue_local?
      @view.gameover_lose
    end
  end
end
