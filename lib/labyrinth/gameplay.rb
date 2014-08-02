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

  def no_door?(direction)
    @position[direction.to_sym] == "wall"
  end

  def move(direction)
    unless @position[direction.to_sym].class != Symbol
      @position = Map.enter_room(@position[direction.to_sym])
    end
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
    @grue = Map.enter_room(@grue[direction])
  end

  # def find_player(room, route = [], found_route = new_route)
  #   route << room
  #   if @position[:name] == room[:name]
  #     found_route = route.dup if route.length < found_route.length
  #   end
  #   room.each_value do |next_room|
  #     break if route.length >= found_route.length
  #     if next_room.class == Symbol
  #       found_route = find_player(Map.enter_room(next_room), route, found_route)
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
