
require "chordproko/chord"
require "chordproko/chord_group"
require "chordproko/comment"
require "chordproko/directive"
require "chordproko/line"
require "chordproko/lyric"
require "chordproko/newline"
require "chordproko/parser"
require "chordproko/plain_song"
require "chordproko/sheet"
require "chordproko/transform"
require "chordproko/version"
module Chordproko
	@@formatter = "Chordproko::PlainSong"

	def self.set_formatter_class formatter
		@@formatter = formatter
	end
  def self.text song, options={}
  	parsed = Chordproko::Parser.new.parse(song)
  	transformed = Transform.new.apply(parsed)
  	sheet = Object.const_get(@@formatter).new(transformed, options)
  	sheet.to_s
  end
end
