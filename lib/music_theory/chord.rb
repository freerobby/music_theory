require "music_theory/note"

module MusicTheory
  class Chord
    attr_accessor :notes
    
    def initialize(descriptor)
      self.notes = []
      if descriptor.is_a?(Array)
        descriptor.each do |note|
          self.notes << Note.new(note)
        end
      end
    end
    
    def == (other_chord)
      self.notes == other_chord.notes
    end
  end
end