[![Gem Version](https://badge.fury.io/rb/chordproko.svg)](https://badge.fury.io/rb/chordproko)
# Chordproko

Chordproko is a parser for ruby. It converts chordpro format to a readable text format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chordproko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chordproko

## Usage

Suppose you have a song sheet written in ChordPro format:

```ruby
sheet = "Th[C]is is a sam[G]ple lyr[Em]ic with ch[D]ord"
readable_sheet = Chordproko.text(sheet)
```

Or load from file

```ruby
file = File.new("file_location")
readable_sheet = Chordproko.text(file.read)
```
### Transposing

You can transpose a song by adding ```transpose``` option.

```ruby
readable_sheet = Chordproko.text(file.read, transpose: 2)
``` 
Negative value means transpose down, otherwise, transpose up.

### Using raw data

Create your own algorithm using the result of Chordproko **Parser**. It uses parslet so you have to learn parslet first. You can check the source code for rules.
```ruby
parsed = Chordproko::Parser.new.parse(file.read)
```
Then, create your own **Transform** class.

## TODO

+ Enable you to extend PlainSong class

```ruby
class MySongFormat < Chordproko::PlainSong
	...
end
```

PlainSong is responsible in formatting the ChordPro format to a readable plain text format. 

+ Improve specs
+ Improve documentations
+ Improve source (so many unnecessary lines. It works, so it's fine for now.)
+ Support ```b``` flat sign 
+ Implement PlainSong methods with block (Might help a lot in customizing contents.)
+ Add settings and customization
+ Learns sheet key.

## Contributing

I'm certain that you have reached this section haha. This is my first gem, I still have a lot to learn. You can report errors, suggest features and create pull requests here, https://github.com/neume/chordproko.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).