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
    it "evaluates double-sharps" do
      Note.new("c##").should == Note.new(:d)
    end
    it "evalutees double-flats" do
      Note.new("cbb").should == Note.new(:a_sharp)
    end
    it "interprets a leading b as note rather than flat" do
      Note.new("b").should == Note.new(:b)
      Note.new("bb").should == Note.new(:a_sharp)
      Note.new("bbb").should == Note.new(:a)
    end
  end
  
  describe "intervals" do
    # Our examples use key of C.
    EXAMPLES = {
      :minor_third => :e_flat,
      :major_third => :e,
      :diminished_fifth => :f_sharp,
      :perfect_fifth => :g,
      :augmented_fifth => :g_sharp,
      :diminished_seventh => :b_flat_flat,
      :minor_seventh => :b_flat,
      :major_seventh => :b
    }
    EXAMPLES.each do |func, result|
      it "calculates a #{func}" do
        Note.new(:c).send(func).should == Note.new(result)
      end
    end
  end
end
