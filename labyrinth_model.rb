class LabyrinthModel
  attr_reader :position, :exit

  def initialize(maze = create_maze)
    @maze = maze
    @position = maze.to_a[rand(0..maze.length-1)][1]
    @grue = maze.to_a[rand(0..maze.length-1)][1]
    @exit = maze.to_a[rand(0..maze.length-1)][1]
  end

  def move(direction)
    unless @position[direction.to_sym] == nil
      @position = @maze[@position[direction.to_sym]]
    end
  end

  def find_player(room, route = [])
    nil if distance == route.length > 3
    room.each_value do |next_room|
      route << next_room
      find_player(next_room, route)
    end

  end

  def gameover?
    false
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