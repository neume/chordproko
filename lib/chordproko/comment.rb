module Chordproko
	class Comment
	  attr_accessor :content
	  def each(&block)
	  	[self].each(&block)
	  end
	  def initialize content
	    @content = content
	  end

	  def to_s
	    "#{@content}"
	  end
	end
end