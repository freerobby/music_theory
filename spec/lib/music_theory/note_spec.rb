require "spec_helper"
include MusicTheory

describe MusicTheory::Note do
  describe "#new" do
    it "evaluates from symbol" do
      Note.new(:d_sharp).should == Note.new(:e_flat)
    end
    it "evaluates from string" do
      Note.new(:d_sharp).should == Note.new("d#")
    end
    it "evalutes with case insensitivity" do
      Note.new("d#").should == Note.new("D#")
    end
  end
end
