class TextAnalyzer
  def process
    file_process = File.open('2.txt', 'r')
    yield(file_process.read)
    file_process.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split(/\n\n/).size} paragraphs" }
analyzer.process { |file| puts "#{file.split(/\n/).size} lines" }
analyzer.process { |file| puts "#{file.split(' ').size} words" }

#analyzer.process { # your implementation }