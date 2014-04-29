class LabyrinthView

  def initialize
    puts "Welcome to Labyrinth"
    puts "Press enter to begin"
    gets
  end

  def new_room(room, token = false)
    puts "you are in the #{room}"
    puts "which way would you like to move next?"
    gets.chomp
  end
end