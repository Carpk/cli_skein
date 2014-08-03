require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Player" do

  let(:player) {Player.new(:violet)}

  it "should know if door is available for passed direction" do
    player.door_available?(:west).should eq(true)
  end

  it "should move position in direction" do
    player.move(:south).should eq(:burnt_sienna)
  end

  it "should retuen name of current room" do
    player.room_name.should eq("Violet Room")
  end
end