require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Map" do

  let(:map) {Map.new}

  it "should generate a random room hash" do
    Map.random_room.class.should eq(Symbol)
  end

  # it "should return name of current room" do
  #   Map.room_options(:vermillion)[:name].should eq("Vermillion Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:ochre)[:name].should eq("Ochre Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:chartreuse)[:name].should eq("Chartreuse Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:emerald)[:name].should eq("Emerald Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:aquamarine)[:name].should eq("Aquamarine Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:lavender)[:name].should eq("Lavender Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:cobalt)[:name].should eq("Cobalt Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:violet)[:name].should eq("Violet Room")
  # end

  # it "should return name of current room" do
  #   Map.room_options(:burnt_sienna)[:name].should eq("Burnt Sienna Room")
  # end

  it "should return the correct name of the room" do
    room = :violet
    Map.name_of_room(room).should eq("Violet Room")
  end

  it "should return the correct name of the room" do
    room = :aquamarine
    Map.name_of_room(room).should eq("Aquamarine Room")
  end

  it "should return symbol of next room" do
    room = :ochre
    direction = :north
    Map.next_room(room, direction).should eq(:vermillion)
  end

  it "should return symbol of next room" do
    room = :emerald
    direction = :east
    Map.next_room(room, direction).should eq(:lavender)
  end

  it "should return symbol of next room" do
    room = :aquamarine
    direction = :south
    Map.next_room(room, direction).should eq(:violet)
  end

  it "should return symbol of next room" do
    room = :violet
    direction = :west
    Map.next_room(room, direction).should eq(:chartreuse)
  end





  it "should return array of the 3 exits" do
    room = :violet
    answer = [:burnt_sienna, :burnt_sienna, :chartreuse]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 3 exits" do
    room = :emerald
    answer = [:lavender, :aquamarine, :cobalt]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 2 exits" do
    room = :lavender
    answer = [:chartreuse, :burnt_sienna]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 2 exits" do
    room = :burnt_sienna
    answer = [:emerald, :lavender]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return cardinal exits of a room" do
    room = :violet
    exits = [:east, :south, :west]
    Map.cardinal_exits(room).should eq(exits)
  end
end