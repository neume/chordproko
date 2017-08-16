module Chordproko
	class Newline
	  attr_accessor :content
	  def initialize content
	    @content = content
	  end
	  def each(&block)
	  	[self].each(&block)
	  end
	  def to_s
	    ""
	  end
	end
end