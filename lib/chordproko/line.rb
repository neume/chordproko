module Chordproko
  class Line
    attr_accessor :content
    def initialize content
      @content = content
    end

    def each(&block)
      @content.each(&block) rescue [@content]
    end
    def to_s
      case @content.class.to_s
      when "Chordproko::Comment"
        @content.to_s
      when "Chordproko::Directive"
        @content.to_s
      when "String"
        ""
      else
        chords = ""
        lyrics = ""
        prev_lyrics = ""
        @content.each do |c|
          case c.class.to_s
          when "Chordproko::ChordGroup"
            chords += " " * prev_lyrics.size + "#{c}"
          when "Chordproko::Lyric"
            prev_lyrics = "#{c}"
            lyrics += "#{c}"
          end
        end
        "#{chords}\n#{lyrics}"
      end
    end
  end
end