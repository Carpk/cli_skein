class GamePlay
  attr_reader :rubies

  def initialize(position = Map.random_room)
    @position = position
    @exit = position
    @grue = spawn_grue
    @progress = true
    @rubies = 0
  end

  def position
    Map.name_of_room(@position)
  end

  def exit
    Map.name_of_room(@exit)
  end

  def door_available?(direction)
    available_doors = Map.cardinal_exits(@position)
    available_doors.include?(direction)
  end

  def move(direction)
    @position = Map.next_room(@position, direction)
    # unless @position[direction].class != Symbol
    #   @position = Map.room_options(@position[direction.to_sym]) #TODO FIX room_options
    # end
  end

  def grue_find_player
    @grue = Compass.move_to_target(@grue, @position)
    if grue_in_room?
      @progress = false
    end
  end

  def grue_in_room?
    @grue == @position
  end

  def grue_random_move
    @rubies += 1
    direction = nil
    direction = [:north,:east,:south,:west].sample while @grue[direction] == "wall"
    @grue = Map.next_room(@grue, direction)
  end

  # def find_player(room, route = [], found_route = new_route)
  #   route << room
  #   if @position[:name] == room[:name]
  #     found_route = route.dup if route.length < found_route.length
  #   end
  #   room.each_value do |next_room|
  #     break if route.length >= found_route.length
  #     if next_room.class == Symbol
  #       found_route = find_player(Map.room_options(next_room), route, found_route)
  #     end
  #   end
  #   route.pop
  #   found_route
  # end

  # def new_route
  #   Array.new(6)
  # end

  def spawn_grue
    possible_spawn = Map.random_room
    if Compass.find_target(possible_spawn, @position).length > 3
      possible_spawn
    else
      spawn_grue
    end
  end

  def win?
    @position == @exit && rubies >= 5
  end

  def gameover?
    grue_in_room? || win?
  end
end
