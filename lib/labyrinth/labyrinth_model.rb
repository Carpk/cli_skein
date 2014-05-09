class LabyrinthModel
  attr_reader :position, :exit, :progress

  def initialize(maze = create_maze)
    @maze = maze
    @position = generate_position
    @grue = spawn_grue
    @exit = generate_position
    @progress = true
  end

  def move(direction)
    unless @position[direction.to_sym] == nil
      @position = @maze[@position[direction.to_sym]]
    end
  end

  def grue_move
    route = find_player(@grue)
    @grue = route[1]
    if @grue == @position[:name]
      @progress = false
      return true
    end
  end

  def grue_local?
    @grue[:name] == @position[:name]
  end

  def grue_random_move
    direction = [:north,:east,:south,:west].sample
    @grue[direction]
  end

  def find_player(room, route = [], found_route = [nil,nil,nil,nil,nil,nil])
    route << room[:name]
    if @position[:name] == room[:name]
      found_route = route.dup if route.length < found_route.length
    end
    room.each_value do |next_room|
      break if route.length >= (found_route.length)
      if next_room.class == Symbol
        found_route = find_player(@maze[next_room], route, found_route)
      end
    end
    route.pop
    found_route
  end

  def gameover?
    @progress
  end

  def generate_position
    @maze.to_a[rand(0..@maze.length-1)][1]
  end

  def spawn_grue
    possible_position = generate_position
    return possible_position if find_player(possible_position).length > 3
    spawn_grue
  end

  def create_maze
    { vermillion: {name: "Vermillion Room", north: nil, east: :ochre, south: :aquamarine, west: nil},
      ochre: {name: "Ochre Room", north: :vermillion, east: :chartreuse , south: :ochre, west: nil},
      chartreuse: {name: "Chartreuse Room", north: :ochre, east: nil, south: :emerald , west: nil},
      emerald: {name: "Emerald Room", north: nil, east: :lavender, south: :aquamarine, west: :cobalt},
      aquamarine: {name: "Aquamarine Room", north: nil, east: nil, south: :violet, west: :cobalt},
      lavender: {name: "Lavender Room", north: nil, east: :chartreuse , south: nil, west: :burnt_sienna},
      cobalt: {name: "Cobalt Room", north: :vermillion, east: nil, south: :burnt_sienna, west: :vermillion},
      violet: {name: "Violet Room", north: nil, east: :burnt_sienna, south: :burnt_sienna, west: :chartreuse},
      burnt_sienna: {name: "Burnt Sienna Room", north: :emerald, east: :lavender, south: nil, west: nil}}
  end
end