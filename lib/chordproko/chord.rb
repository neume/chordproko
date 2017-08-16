module Chordproko

	class Chord
	  attr_accessor :content, :key
	  def initialize content
	    @content = content	
	    @chord_list = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
	    @chord_indexes = {
	      "C" => 0,
	      "D" => 2,
	      "E" => 4,
	      "F" => 5,
	      "G" => 7,
	      "A" => 9,
	      "B" => 11,
	    }
	  end
	  def each(&block)
	  	[self].each(&block)
	  end
	  def to_s
	    "#{transpose_key}"
	  end
	  def transpose_key
	    return @content.to_s if @key == 0
	    chord_value = @chord_indexes[@content.to_s[0]]
	    @content.to_s[1..-1].each_char do |mod|
	      case mod
	      when "#"
	        chord_value += 1
	      when "b"
	        chord_value -= 1
	      end
	    end
	    chord_index = (chord_value + @key)% 12
	    res = @chord_list[chord_index]

	  end
	end
end