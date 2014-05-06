class LabyrinthModel
  attr_reader :position, :exit

  def initialize(maze = create_maze)
    @maze = maze
    @position = generate_position
    @grue = generate_position
    @exit = generate_position
  end

  def move(direction)
    unless @position[direction.to_sym] == nil
      @position = @maze[@position[direction.to_sym]]
    end
  end

  def find_player(room, route = [], found_route = [nil,nil,nil,nil,nil,nil])
    route << room[:name]
    if @position[:name] == room[:name]
      found_route = route.dup if route.length < found_route.length
    end
    room.each_value do |next_room|
      break if route.length > (found_route.length - 1)
      if next_room.class == Symbol
        found_route = find_player(@maze[next_room], route, found_route)
      end
    end
    route.pop
    found_route
  end



  def gameover?
    false
  end

  def generate_position
    @maze.to_a[rand(0..@maze.length-1)][1]
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