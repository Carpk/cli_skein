class Player
  attr_reader :position

  def initialize(position = :violet,rubies = 0)
    @position = position
    @rubies = rubies
  end

  # def collect_ruby
  #   @rubies += 1
  # end

  def door_available?(direction)
    available_doors = Map.cardinal_exits(@position)
    available_doors.include?(direction)
  end

  def move(direction)
    @position = Map.next_room(@position, direction)
  end

  def room_name
    Map.name_of_room(@position)
  end
end