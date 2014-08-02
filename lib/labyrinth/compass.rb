class Compass

  def find_target(current_room, target, route = [], shortest_route = new_route)
    route << current_room
    if target[:name] == current_room[:name]
      shortest_route = route.dup if route.length < shortest_route.length
    end
    Map.doors_for(current_room).each do |next_door|
      break if route.length >= shortest_route.length
      if next_door.class == Symbol
        shortest_route = find_player(Map.enter_room(next_door), target, route, shortest_route)
      end
    end
    route.pop
    shortest_route
  end

  def new_route
    Array.new(6)
  end
end