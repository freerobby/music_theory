require "spec_helper"
include MusicTheory

describe MusicTheory::Chord do
  describe "#new" do
    it "evaluates from symbols" do
      Chord.new([:c, :e, :g]).should == Chord.new([:c, :e, :g])
    end
    it "evaluates from strings" do
      Chord.new(["c", "e", "g"]).should == Chord.new([:c, :e, :g])
    end
    it "evalutes with case insensitivity" do
      Chord.new(["c", "E", "G"]).should == Chord.new([:c, :e, :g])
    end
  end
end
