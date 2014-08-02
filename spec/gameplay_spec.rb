require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "GamePlay" do

  let(:game) {GamePlay.new(:violet)}

  it "should not be over when starting" do
    game.gameover?.should eq(false)
  end

  it "should return name of room to exit" do
    game.door_available?(:north).should eq(false)
  end

  it "should return name of room to exit" do
    game.door_available?(:east).should eq(true)
  end

  it "should return name of room to exit" do
    game.door_available?(:south).should eq(true)
  end

  it "should return name of room to exit" do
    game.door_available?(:west).should eq(true)
  end

  it "should move player to new room" do
    game.move(:east).should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    game.move(:south).should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    game.move(:west).should eq(:chartreuse)
  end

  # it "should return starting number of rubies" do
  #   game.rubies.should eq(0)
  # end

  # it "should return correct object" do
  #   game.grue_find_player.should eq(nil)
  # end

  # it "should return position far from player" do
  #   game.spawn_grue.class.should eq(Hash)
  # end

  # it "should move grue closer to player" do
  #   game.grue_find_player.should eq(nil)
  # end

  # it "should return boolean if player and grue are in the same room" do
  #   game.grue_local?.should eq(false)
  # end

  # it "should move grue out a random door" do
  #   game.grue_random_move.class.should eq(Hash)
  # end
end