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

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game = GamePlay.new(:ochre)
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end
end
