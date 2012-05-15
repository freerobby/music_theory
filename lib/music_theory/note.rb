module MusicTheory
  class Note
    BASE_POSITIONS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    BASE_CANONICALS = {
      0 => [:c],
      1 => [:c_sharp, :d_flat],
      2 => [:d],
      3 => [:d_sharp, :e_flat],
      4 => [:e],
      5 => [:f],
      6 => [:f_sharp, :g_flat],
      7 => [:g],
      8 => [:g_sharp, :a_flat],
      9 => [:a],
      10 => [:a_sharp, :b_flat],
      11 => [:b]
    }
    OCTAVES = [0..8]
    
    attr_accessor :position
    
    def initialize(descriptor)
      if descriptor.is_a?(Symbol)
        BASE_CANONICALS.each do |position, symbols|
          self.position = position if symbols.include?(descriptor)
        end
      elsif descriptor.is_a?(String)
        descriptor.downcase!
        descriptor.gsub!(/(.)\#/, '\1_sharp')
        descriptor.gsub!(/(.)b/, '\1_flat')
        self.position = Note.new(descriptor.to_sym).position
      end
    end
    
    def == (other_note)
      self.position.should == other_note
    end
  end
end