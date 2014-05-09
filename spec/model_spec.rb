require_relative "../lib/labyrinth/console"

describe "labyrinth_model" do

  let(:data) {LabyrinthModel.new}

  it "should return correct object" do
    data.find_player(data.exit).class.should eq(Array)
  end

  it "should return position far from player" do
    data.spawn_grue.class.should eq(Hash)
  end

  it "should move grue closer to player" do
    data.grue_move.should eq(nil)
  end

  it "should return boolean if player and grue are in the same room" do
    data.grue_local?.should eq(false)
  end

  it "should move grue to random door" do
    data.grue_random_move.class.should eq(Symbol)
  end
end