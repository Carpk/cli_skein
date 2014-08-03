require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Player" do

  let(:player) {Player.new(:violet)}

  it "should return the player's correct positon" do
    player.position.should eq(:violet)
  end

  it "should return the player's correct positon" do
    player = Player.new(:burnt_sienna)
    player.position.should eq(:burnt_sienna)
  end

  it "should return the player's correct positon" do
    player = Player.new(:emerald)
    player.position.should eq(:emerald)
  end

  it "should return the player's correct positon" do
    player = Player.new(:aquamarine)
    player.position.should eq(:aquamarine)
  end

  it "should add a single ruby to the collection" do
    player.collect_ruby.should eq(1)
  end

  it "should add a single ruby to the collection" do
    player = Player.new(:burnt_sienna, 2)
    player.collect_ruby.should eq(3)
  end

  it "should add a single ruby to the collection" do
    player = Player.new(:burnt_sienna, 2)
    player.collect_ruby.should eq(3)
  end

  it "should add a single ruby to the collection" do
    player = Player.new(:burnt_sienna, 3)
    player.collect_ruby.should eq(4)
  end

  it "should return false if player has enough rubies" do
    player.max_rubies?.should eq(false)
  end

  it "should return true if player has enough rubies" do
    player = Player.new(:burnt_sienna, 4)
    player.max_rubies?.should eq(false)
  end

  it "should return true if player has enough rubies" do
    player = Player.new(:vermillion, 5)
    player.max_rubies?.should eq(true)
  end

  it "should return true if player has enough rubies" do
    player = Player.new(:emerald, 7)
    player.max_rubies?.should eq(true)
  end

  it "should know if door is available for passed direction" do
    player.door_available?(:west).should eq(true)
  end

  it "should know if door is available for passed direction" do
    player = Player.new(:burnt_sienna)
    player.door_available?(:north).should eq(true)
  end

  it "should know if door is available for passed direction" do
    player = Player.new(:cobalt)
    player.door_available?(:west).should eq(true)
  end

  it "should know if door is available for passed direction" do
    player = Player.new(:chartreuse)
    player.door_available?(:south).should eq(true)
  end

  it "should know if door is not available for passed direction" do
    player = Player.new(:vermillion)
    player.door_available?(:west).should eq(false)
  end

  it "should know if door is not available for passed direction" do
    player = Player.new(:emerald)
    player.door_available?(:north).should eq(false)
  end

  it "should know if door is not available for passed direction" do
    player = Player.new(:cobalt)
    player.door_available?(:east).should eq(false)
  end

  it "should move position in direction" do
    player.move(:south).should eq(:burnt_sienna)
  end

  it "should move position in direction" do
    player = Player.new(:ochre)
    player.move(:north).should eq(:vermillion)
  end

  it "should move position in direction" do
    player = Player.new(:aquamarine)
    player.move(:south).should eq(:violet)
  end

  it "should move position in direction" do
    player = Player.new(:chartreuse)
    player.move(:north).should eq(:ochre)
  end

  it "should move position in direction" do
    player = Player.new(:emerald)
    player.move(:east).should eq(:lavender)
  end

  it "should move position in direction" do
    player = Player.new(:lavender)
    player.move(:west).should eq(:burnt_sienna)
  end

  it "should retuen name of current room" do
    player.room_name.should eq("Violet Room")
  end

  it "should retuen name of current room" do
    player = Player.new(:emerald)
    player.room_name.should eq("Emerald Room")
  end

  it "should retuen name of current room" do
    player = Player.new(:aquamarine)
    player.room_name.should eq("Aquamarine Room")
  end

  it "should retuen name of current room" do
    player = Player.new(:burnt_sienna)
    player.room_name.should eq("Burnt Sienna Room")
  end
end