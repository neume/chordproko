require "spec_helper"

RSpec.describe Chordproko do
	before do 
  	@line = "Th[C]is is a sam[G]ple lyr[Em]ic with ch[D]ord"
	end
  it "has a version number" do
    expect(Chordproko::VERSION).not_to be nil
  end

  it "converts ChordPro to ChordSheet" do
  	sheet = Chordproko.text(@line)
  	result  = "  C          G      Em        D\n"
  	result += "This is a sample lyric with chord\n"
  	expect(sheet).to eq(result)
  end
  
  it "transposes a ChordPro File to 2 keys up" do
  	sheet = Chordproko.text(@line, transpose: 2)
  	result  = "  D          A      F#m       E\n"
  	result += "This is a sample lyric with chord\n"
  	expect(sheet).to eq(result)
  end
end
