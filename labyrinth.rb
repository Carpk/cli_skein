require_relative 'labyrinth_model'
require_relative 'labyrinth_view'
class LabyrinthController

  def initialize
    @view = LabyrinthView.new
    @data = LabyrinthModel.new
  end

  def play
    while @data.gameover? == false
      room = @data.position[:name]
      direction = @view.new_room(room)
      @data.move(direction)
    end
  end
end

LabyrinthController.new.play