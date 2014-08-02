require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "Compass" do

  let(:compass) {Compass.new}

  it "should return correct route to find target" do
    person = :ochre
    target = :cobalt
    answer = [:ochre, :vermillion, :aquamarine, :cobalt]
    Compass.find_target(person, target).should eq(answer)
  end

  it "should return correct route to find target" do
    person = :vermillion
    target = :lavender
    answer = [:vermillion, :ochre, :chartreuse, :emerald, :lavender]
    Compass.find_target(person, target).should eq(answer)
  end

  it "should return correct route to find target" do
    person = :burnt_sienna
    target = :aquamarine
    answer = [:burnt_sienna, :emerald, :aquamarine]
    Compass.find_target(person, target).should eq(answer)
  end

  it "should return correct route to find target" do
    person = :ochre
    target = :cobalt
    Compass.move_to_target(person, target).should eq(:vermillion)
  end

  it "should return correct route to find target" do
    person = :vermillion
    target = :lavender
    Compass.move_to_target(person, target).should eq(:ochre)
  end

  it "should return correct route to find target" do
    person = :burnt_sienna
    target = :aquamarine
    Compass.move_to_target(person, target).should eq(:emerald)
  end
end