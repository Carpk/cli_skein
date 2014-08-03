require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Grue" do

  let(:monster) {Grue.new(:violet)}

  it "should move closer to player" do
    monster.move_to(:vermillion).should eq(:chartreuse)
  end

  it "should move closer to player" do
    monster.move_to(:emerald).should eq(:burnt_sienna)
  end

  it "should move closer to player" do
    monster = Grue.new(:aquamarine)
    monster.move_to(:vermillion).should eq(:cobalt)
  end

  it "should know if grue has found the player" do
    monster.found_player?(:violet).should eq(true)
  end

  it "should know if grue has found the player" do
    monster = Grue.new(:ochre)
    monster.found_player?(:ochre).should eq(true)
  end

  it "should know if grue has found the player" do
    monster = Grue.new(:vermillion)
    monster.found_player?(:vermillion).should eq(true)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:ochre).should eq(false)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:vermillion).should eq(false)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:chartreuse).should eq(false)
  end

  it "should sent grue through random door" do
    rooms = [:burnt_sienna, :chartreuse]
    rooms.include?(monster.flee_room).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:ochre, :aquamarine]
    monster = Grue.new(:vermillion)
    rooms.include?(monster.flee_room).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:chartreuse, :burnt_sienna]
    monster = Grue.new(:lavender)
    rooms.include?(monster.flee_room).should eq(true)
  end
end