class Text2Mp3

  # Generate mp3 ofile of text using voice.
  def self.text2mp3(voice, ofile, text)
    raise "Output file already exists" if File.exist?(ofile)
    raise "No text" if text.strip() == ''
    tmp = "#{ofile}.tmp"
    raise "Temp file already exists" if File.exist?(tmp)

    `say -v #{voice} -o #{tmp} "#{text}"`
    `lame --silent -m m #{tmp} #{ofile}`
    File.delete(tmp)
  end

end
