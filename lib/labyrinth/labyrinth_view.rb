class LabyrinthView

  def initialize(exit_room)
    clear_screen
    instructions(exit_room)
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

  def choose_room(room, token = false)
    puts "you are in the #{room}"
    puts "which way would you like to move next?"
    gets.chomp
  end

  def grue_flee(num_rubies)
    plural = "Ruby" if num_rubies == 1
    puts "As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door."
    puts "But lo and behold, you find a beautiful shining Ruby in the middle of the floor!"
    puts "You have #{num_rubies} #{plural ||= "Rubies"}!"
  end

  def gameover_lose
    puts "The Grue enters the room and devoures you. Game over."
  end

  def instructions(exit_room)
    print <<-EOF
    Welcome to Labyrinth

    Navigate using the commands north, south, east, and west.

    You must collect 5 gems and head to the #{exit_room} to win the game.
    If the grue enters your room on a rest move, he will devoure you and
    you will lose the game. Good Luck!

    Press enter to begin
    EOF
    gets
    clear_screen
  end
end