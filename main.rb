require 'optparse'

options = { voice: 'Samantha' }
OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
  opts.on("-v", "--voice=VOICE", String, "Set the voice") do |v|
    options[:voice] = v
  end
  opts.on("-o", "--output=FILE", String, "Output filename (.mp3)") do |s|
    options[:output] = s
  end
end.parse!

f = options[:output]
raise "-o filename required" if f.nil?
f = "#{f}.mp3" unless f =~ /\.mp3$/
tmp = "#{f}.tmp"
raise "Output file already exists" if File.exist?(f)
raise "Temp file already exists" if File.exist?(tmp)
options[:output] = f

sentence = ARGV.join(' ')
raise "No sentence" if sentence.strip() == ''
options[:sentence] = sentence

# puts options

`say -v #{options[:voice]} -o #{tmp} "#{options[:sentence]}"`
`lame --silent -m m #{tmp} #{options[:output]}`
File.delete(tmp)
