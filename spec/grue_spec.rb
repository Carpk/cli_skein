require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Grue" do

  let(:monster) {Grue.new(:violet)}

  it "should sent grue through random door" do
    rooms = [:burnt_sienna, :chartreuse]
    rooms.include?(monster.random_move).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:ochre, :aquamarine]
    monster = Grue.new(:vermillion)
    rooms.include?(monster.random_move).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:chartreuse, :burnt_sienna]
    monster = Grue.new(:lavender)
    rooms.include?(monster.random_move).should eq(true)
  end
end