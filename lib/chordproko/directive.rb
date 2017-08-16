module Chordproko
	class Directive
	  attr_accessor :key, :value

	  def each(&block)
	  	[self].each(&block)
	  end
	  def initialize key, value
	    @key = key
	    @value = value
	  end
	  def to_s
	    "#{@key.to_s.capitalize}: #{@value}"
	  end
	end
end