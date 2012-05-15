module MusicTheory
  class Note
    BASE_POSITIONS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    NUM_POSITIONS = BASE_POSITIONS.length
    BASE_CANONICALS = {
      0 => [:c, :b_sharp, :d_flat_flat],
      1 => [:c_sharp, :b_sharp_sharp, :d_flat],
      2 => [:d, :c_sharp_sharp, :e_flat_flat],
      3 => [:d_sharp, :e_flat, :f_flat_flat],
      4 => [:e, :d_sharp_sharp, :f_flat],
      5 => [:f, :e_sharp, :g_flat_flat],
      6 => [:f_sharp, :e_sharp_sharp, :g_flat],
      7 => [:g, :f_sharp_sharp, :a_flat_flat],
      8 => [:g_sharp, :a_flat],
      9 => [:a, :g_sharp_sharp, :b_flat_flat],
      10 => [:a_sharp, :b_flat, :c_flat_flat],
      11 => [:b, :a_sharp_sharp, :c_flat]
    }
    OCTAVES = [0..8]
    
    INTERVALS = { # Define as number of semitones
      :minor_third => 3,
      :major_third => 4,
      
      :diminished_fifth => 6,
      :perfect_fifth => 7,
      :augmented_fifth => 8,
      
      :diminished_seventh => 9,
      :minor_seventh => 10,
      :major_seventh => 11
    }
    
    attr_accessor :position
    
    def initialize(descriptor)
      if descriptor.is_a?(Integer)
        self.position = descriptor % NUM_POSITIONS
      elsif descriptor.is_a?(Symbol)
        BASE_CANONICALS.each do |position, symbols|
          self.position = position if symbols.include?(descriptor)
        end
      elsif descriptor.is_a?(String)
        descriptor.downcase!
        descriptor.gsub!("#", "_sharp")
        descriptor.gsub!(/(.)b(.*)/, '\1_flat\2')
        descriptor.gsub!(/(.)b/, '\1_flat')
        self.position = Note.new(descriptor.to_sym).position
      end
    end
    
    def == (other_note)
      self.position.should == other_note.position
    end
    
    def canonical
      BASE_CANONICALS[self.position][0]
    end
    
    INTERVALS.each do |interval, semitones|
      define_method interval do
        Note.new((self.position + semitones) % NUM_POSITIONS)
      end
    end
  end
end