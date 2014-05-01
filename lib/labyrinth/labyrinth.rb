
class LabyrinthController

  def initialize
    @data = LabyrinthModel.new
    @view = LabyrinthView.new(@data.exit[:name])
  end

  def play
    while @data.gameover? == false
      room = @data.position[:name]
      direction = @view.new_room(room)
      if @data.position[direction.to_sym] == nil
        @view.no_door
      else
        @view.clear_screen
        @data.move(direction)
      end
    end
  end
end