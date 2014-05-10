class LabyrinthView

  def initialize(exit_room)
    clear_screen
    puts "Welcome to Labyrinth, your exit is the #{exit_room}"
    puts "Press enter to begin"
    gets
  end

  def no_door
    puts "you check the seemless wall... there does not appear to be a door here"
  end

  def clear_screen
    print "\e[2J"
  end

  def rest
    puts "You have had 5 consecutive turns, you take time to rest."
    puts "You believe you hear something off in the distance"
  end

  def find_exit(rubies, exit)
    puts "You have obtained #{rubies} Rubies, make your way to the #{exit}."
  end

  def new_room(room, token = false)
    # art
    puts "you are in the #{room}"
    puts "which way would you like to move next?"
    gets.chomp
  end

  def grue_flee
    puts "As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door."
    puts "But low and behold, you find a beautiful shining Ruby in the middle of the floor!"
  end

  def gameover_lose
    puts "The Grue enters the room and eats you. Game over."
  end
end