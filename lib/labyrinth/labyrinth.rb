
class LabyrinthController

  def initialize
    @data = LabyrinthModel.new
    @view = LabyrinthView.new(@data.exit[:name])
  end

  def method_name

  end

  def play
    turn = 0
    while @data.progress
      room = @data.position[:name]
      turn = rest if turn >= 5
      direction = @view.new_room(room)
      if @data.position[direction.to_sym] == nil
        @view.no_door
      else
        turn += 1
        @view.clear_screen
        @data.move(direction)
        @view.grue_flee if @data.grue_local?
      end
    end
  end

  def rest
    @view.rest
    if @data.grue_move
      @view.gameover_lose if @data.grue_move
      @data.grue_random_move
    end
    sleep(3)
    0
  end
end