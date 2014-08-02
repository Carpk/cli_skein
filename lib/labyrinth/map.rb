class Map

  def self.random_room
    map = MapConfig::Map
    map.to_a[rand(0..map.length-1)].first
  end

  # def self.room_options(room)
  #   MapConfig::Map[room]
  # end

  def self.name_of_room(room_symbol)
    MapConfig::Map[room_symbol][:name]
  end

  def self.next_room(room, direction)
    MapConfig::Map[room][direction]
  end

  def self.neighboring_rooms(room_symbol)
    room = MapConfig::Map[room_symbol]
    doors = []
    room.each_value do |door|
      doors << door unless door.class != Symbol
    end
    doors
  end

  def self.cardinal_exits(room_symbol)
    room = MapConfig::Map[room_symbol]
    directions = []
    room.each do |direction, possible_door|
      directions << direction if possible_door.class == Symbol
    end
    directions
  end

end
