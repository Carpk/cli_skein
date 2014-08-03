class Player
  attr_reader :position

  def initialize(position,rubies = 0)
    @position = position
    @rubies = rubies
  end

  def collect_ruby
    @rubies += 1
  end

  def max_rubies? #TODO better name
    @rubies >= 5
  end

  def door_available?(direction)
    Map.door_available?(@position, direction)
  end

  def move(direction)
    @position = Map.next_room(@position, direction)
  end

  def room_name
    Map.name_of_room(@position)
  end
end