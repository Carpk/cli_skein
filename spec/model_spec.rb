require_relative "../lib/labyrinth/console"

describe "labyrinth_model" do

  let(:data) {LabyrinthModel.new}

  it "should return correct object" do
    data.find_player(data.exit).class.should eq(Array)
  end

end