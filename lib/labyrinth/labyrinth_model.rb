class LabyrinthModel
  attr_reader :progress, :rubies

  def initialize(maze = MapConfig::Map)
    @maze = maze
    @position = generate_position
    @grue = spawn_grue
    @exit = generate_position
    @progress = true
    @rubies = 0
  end

  def position
    @position[:name]
  end

  def exit
    @exit[:name]
  end

  def no_door?(direction)
    @position[direction.to_sym] == nil
  end

  def move(direction)
    unless @position[direction.to_sym] == nil
      @position = @maze[@position[direction.to_sym]]
    end
  end

  def grue_find_player
    @grue = find_player(@grue)[1]
    if grue_local?
      @progress = false
    end
  end

  def grue_local?
    @grue[:name] == @position[:name]
  end

  def grue_random_move
    @rubies += 1
    direction = nil
    direction = [:north,:east,:south,:west].sample while @grue[direction] == nil
    @grue = @maze[@grue[direction]]
  end

  def find_player(room, route = [], found_route = [nil,nil,nil,nil,nil,nil])
    route << room
    if @position[:name] == room[:name]
      found_route = route.dup if route.length < found_route.length
    end
    room.each_value do |next_room|
      break if route.length >= found_route.length
      if next_room.class == Symbol
        found_route = find_player(@maze[next_room], route, found_route)
      end
    end
    route.pop
    found_route
  end

  def generate_position
    @maze.to_a[rand(0..@maze.length-1)][1]
  end


  def spawn_grue
    possible_position = generate_position
    return possible_position if find_player(possible_position).length > 3
    spawn_grue
  end

  def win?
    if @position == @exit && rubies >= 5
      @progress = false
      true
    end
  end
end