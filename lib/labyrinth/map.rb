class Map

  def self.random_room
    map = MapConfig::Map
    map.to_a[rand(0..map.length-1)][1]
  end

  def self.enter_room(room)
    MapConfig::Map[room]
  end

  def self.leave_room(room, direction)
    # this returns a new symbol
  end

  def self.doors_for(room)
    doors = []
    room.each_value do |door| # passing in a Symbol or Hash?
      doors << door unless door.class != Symbol
    end
    doors
  end
end
