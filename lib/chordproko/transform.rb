module Chordproko
	class Transform < Parslet::Transform
	  rule(newline: simple(:x)) 			{ "" }
	  rule(comment: simple(:x)) 			{ Chordproko::Comment.new(x)}
	  rule(chord: simple(:x))					{ Chordproko::Chord.new(x)}
	  rule(chord_delim: simple(:delim)) { "#{delim}" }
	  rule(lyric: simple(:x)) 				{ Chordproko::Lyric.new(x)}
	  rule(directive: { key: simple(:key), value: simple(:value) }) do
	  	Chordproko::Directive.new(key, value)
	  end
	  rule(chords: subtree(:chords)) 	{ Chordproko::ChordGroup.new(chords)}
	  rule(line: subtree(:line))			{ Chordproko::Line.new(line) }
	  rule(sheet: sequence(:sheet)) 	{ Chordproko::Sheet.new(sheet) }
	end
end