module Chordproko
	class PlainSong
		def initialize sheet, options={transpose: 1}
			@sheet = sheet
			@options = options
		end
		def to_s
			content
		end
		def content
			@content ||= generate
		end
		def generate
			textified = ""
			@sheet.each do |line|
				chords = ""
				lyrics = ""
				prev_lyrics = ""
				prev_chord = ""
				line.each do |element|
					element.each do |item|
						case item.class.to_s
						when "Chordproko::Comment"
							textified += item.to_s
						when "Chordproko::Directive"
							textified += item.to_s
					  when "Chordproko::ChordGroup"
					  	item.key = @options[:transpose] if @options[:transpose] rescue 0
					  	cgroup = item.to_s
					   	chords += (" " * (prev_lyrics.size - prev_chord.size).abs) + chord_group_format(cgroup)
					   	prev_chord = cgroup

					  when "Chordproko::Lyric"
					    prev_lyrics = item.to_s
					    lyrics += item.to_s
					  end
					end #case
				end #line
			  chord_lyrics = []
			  chord_lyrics << chord_line_format(chords) if chords.size > 0
			  chord_lyrics << lyric_line_format(lyrics) if lyrics.size > 0
				textified += chord_lyrics.join("\n")
				textified += "\n"
			end #sheet
			textified
		end
		
		def chord_group_format str
			str
		end
		def lyric_line_format str
			str
		end
		def chord_line_format str
			str
		end
		def comment_format str
			str
		end
		def directive_format str
			str
		end
		def lyric_format str
			str
		end
	end
end