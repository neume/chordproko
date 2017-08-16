module Chordproko
	class Sheet
	  attr_accessor :content, :transpose
	  def initialize content
	    @content = content
	  end
	  def each(&block)
	  	@content.each(&block)
	  end
	  def to_s
	    @content.each do |line|
	      "#{line}"
	    end.join("\n")
	  end
	end
end