require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Map" do

  let(:map) {Map.new}

  it "should generate a random room hash" do
    Map.random_room.class.should eq(Hash)
  end

  it "should return name of current room" do
    Map.enter_room(:vermillion)[:name].should eq("Vermillion Room")
  end

  it "should return name of current room" do
    Map.enter_room(:ochre)[:name].should eq("Ochre Room")
  end

  it "should return name of current room" do
    Map.enter_room(:chartreuse)[:name].should eq("Chartreuse Room")
  end

  it "should return name of current room" do
    Map.enter_room(:emerald)[:name].should eq("Emerald Room")
  end

  it "should return name of current room" do
    Map.enter_room(:aquamarine)[:name].should eq("Aquamarine Room")
  end

  it "should return name of current room" do
    Map.enter_room(:lavender)[:name].should eq("Lavender Room")
  end

  it "should return name of current room" do
    Map.enter_room(:cobalt)[:name].should eq("Cobalt Room")
  end

  it "should return name of current room" do
    Map.enter_room(:violet)[:name].should eq("Violet Room")
  end

  it "should return name of current room" do
    Map.enter_room(:burnt_sienna)[:name].should eq("Burnt Sienna Room")
  end

  it "should return array of 3 doors" do
    room = {name: "Violet Room", north: "wall", east: :burnt_sienna, south: :burnt_sienna, west: :chartreuse}
    Map.doors_for(room).length.should eq(3)
  end

  it "should return array of 3 exits" do
    room = :violet
    answer = [:burnt_sienna, :burnt_sienna, :chartreuse]
    Map.exits_for(room).should eq(answer)
  end

  it "should return the correct name of the room" do
    room = :violet
    Map.name_of_room(room).should eq("Violet Room")
  end

  it "should return the correct name of the room" do
    room = :aquamarine
    Map.name_of_room(room).should eq("Aquamarine Room")
  end
end