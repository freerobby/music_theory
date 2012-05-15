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
  
  describe "intervals" do
    # Our examples use key of C.
    EXAMPLES = {
      :minor_third => :e_flat,
      :major_third => :e,
      :diminished_fifth => :f_sharp,
      :perfect_fifth => :g,
      :augmented_fifth => :g_sharp
    }
    EXAMPLES.each do |func, result|
      it "calculates a #{func}" do
        n = Note.new(:c)
        i = n.send(func)
        i.should == Note.new(result)
      end
    end
  end
end
