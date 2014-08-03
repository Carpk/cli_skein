require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Grue" do

  let(:monster) {Grue.new(:violet)}

  it "should spawn grue at random location" do
    Grue.spawn_grue(:violet).class.should eq(Symbol)
  end
end