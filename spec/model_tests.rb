require_relative "../lib/labyrinth/labyrinth_model"


test = LabyrinthModel.new
puts test.position[:name]
puts test.exit[:name]
puts test.find_player(test.exit).class