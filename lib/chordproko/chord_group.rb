module Chordproko
	class ChordGroup
	  attr_accessor :content, :key
	  def initialize content
	    @content = content
	    @key = 0
	  end
	  def each(&block)
	  	[self].each(&block)
	  end
	  def to_s
	  	@content.each do |c|
	    	if c.class.to_s == "Chordproko::Chord"
	    		c.key = @key
	    	end
	   		c.to_s
	    end.join
	  end
	end
end