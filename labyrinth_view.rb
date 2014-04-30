class LabyrinthView

  def initialize(exit_room)
    puts "Welcome to Labyrinth, your exit is the #{exit_room}"
    puts "Press enter to begin"
    gets
  end

  def no_door
    puts "you check the seemless wall.... there does not appear to be a door here"
  end

  def clear_screen
    print "\e[2J"
  end

  def new_room(room, token = false)
    # art
    puts "you are in the #{room}"
    puts "which way would you like to move next?"
    gets.chomp
  end
end