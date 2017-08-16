require 'parslet'
require 'parslet/convenience'
module Chordproko
  class Parser < Parslet::Parser
 # Characters
  rule(:space)    { match('\s').repeat }
  rule(:newline)  { str("\n")}
  rule(:lbrace)   { str('{') }
  rule(:rbrace)   { str('}') }
  rule(:lbracket) { str('[') }
  rule(:rbracket) { str(']') }
  rule(:colon)    { str(':')}
  rule(:sharp) { str('#') }
  rule(:flat) { str('b') }
  rule(:chord_modifier) { sharp.maybe >> flat.maybe}
  rule(:chord_base) {match('[ABCDEFG]')}
  rule(:chord) { (chord_base >> chord_modifier.maybe).as(:chord) }
  rule(:chord_delim) { (rbracket.absent? >> chord_base.absent? >>  any).repeat(0).as(:chord_delim) }
  rule(:chords) { (lbracket >> ((rbracket.absent? >> (chord | chord_delim)).repeat(1)).as(:chords) >> rbracket) }
  rule(:lyric) { (lbracket.absent? >> newline.absent? >> any).repeat(1).as(:lyric)}
  rule(:comments) do
   (sharp >> (newline.absent? >> any).repeat).as(:comment)
  end
  rule(:lyrics) do
    ( (newline.absent? >> ( chords | lyric )).repeat(1))
  end
  rule(:key) { match["a-z"].repeat(1).as(:key)}
  rule(:value) { ((rbrace.absent? >> any).repeat(1)).as(:value)}
  rule(:directive) do
    (key >> space.maybe >> colon >> space.maybe >> value).as(:directive)
  end
  rule(:directives) do
    (lbrace >> space.maybe >> (rbrace.absent? >> directive) >> rbrace)
  end
  rule(:line) { ((comments | directives | lyrics | newline.as(:newline)) >> newline.maybe).as(:line)}
  rule(:lines) { line.repeat(1)}
  rule(:sheet) { lines.as(:sheet) }

  root(:sheet)
  end
end