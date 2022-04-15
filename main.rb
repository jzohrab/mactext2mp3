require 'optparse'
require_relative('text2mp3')

voice = 'Samantha'
ofile = nil
OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
  opts.on("-v", "--voice=VOICE", String, "Set the voice") do |v|
    voice = v
  end
  opts.on("-o", "--output=FILE", String, "Output filename (.mp3)") do |s|
    ofile = s
  end
end.parse!

raise "-o filename required" if ofile.nil?
ofile = "#{ofile}.mp3" unless ofile =~ /\.mp3$/

# puts options

Text2Mp3.text2mp3(voice, ofile, ARGV.join(' '))
