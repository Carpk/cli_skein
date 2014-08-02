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
    @position[:name]
    # Map.name_of_room(@position)
  end

  def exit
    @exit[:name]
    # Map.name_of_room(@exit)
  end

  def no_door?(direction)
    @position[direction.to_sym] == "wall"
  end

  def move(direction)
    unless @position[direction.to_sym].class != Symbol
      @position = Map.enter_room(@position[direction.to_sym])
    end
  end

  def grue_find_player
    @grue = find_player(@grue)[1] # Compass.move_to_target(@grue, @position)
    if grue_in_room?
      @progress = false
    end
  end

  def grue_in_room?
    @grue[:name] == @position[:name]
  end

  def grue_random_move
    @rubies += 1
    direction = nil
    direction = [:north,:east,:south,:west].sample while @grue[direction] == "wall"
    @grue = Map.enter_room(@grue[direction])
  end

  def find_player(room, route = [], found_route = new_route)
    route << room
    if @position[:name] == room[:name]
      found_route = route.dup if route.length < found_route.length
    end
    room.each_value do |next_room|
      break if route.length >= found_route.length
      if next_room.class == Symbol
        found_route = find_player(Map.enter_room(next_room), route, found_route)
      end
    end
    route.pop
    found_route
  end

  def new_route
    Array.new(6)
  end

  def spawn_grue
    possible_position = Map.random_room
    return possible_position if find_player(possible_position).length > 3
    spawn_grue
  end

  def win?
    if @position == @exit && rubies >= 5
      @progress = false
      true
    end
  end

  def gameover?
    !@progress
  end
end
