require_relative "../lib/labyrinth/console"

describe "labyrinth_model" do

  let(:data) {LabyrinthModel.new}

  it "should return name of room for position" do
    data.position.class.should eq(String)
  end

  it "should return name of room to exit" do
    data.exit.class.should eq(String)
  end

  it "should return correct boolean for progress" do
    data.progress.should eq(true)
  end

  it "should return starting number of rubies" do
    data.rubies.should eq(0)
  end

  # it "should return boolean if door is available" do
  #   data.no_door?("north").should eq(Boolean)
  # end

  # it "should return correct object" do
  #   data.move("north").should eq(nil)
  # end

  it "should return correct object" do
    data.grue_find_player.should eq(nil)
  end

  it "should return position far from player" do
    data.spawn_grue.class.should eq(Hash)
  end

  it "should move grue closer to player" do
    data.grue_find_player.should eq(nil)
  end

  it "should return boolean if player and grue are in the same room" do
    data.grue_local?.should eq(false)
  end

  it "should move grue out a random door" do
    data.grue_random_move.class.should eq(Hash)
  end
end