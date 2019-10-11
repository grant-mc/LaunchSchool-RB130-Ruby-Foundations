#Input consists of character sets of letters, spaces, "."
#Words at most 20 letters
#One or more words seperated by one or more spaces
#remove extra spaces?
#input starts first letter and ends terminating point
#trim period and add at end?
#make case sensitive

class OddWords
  def self.reverse_odds(string)
    formatted_string = string.downcase.gsub(/[^\w\s]\d*/,'').gsub(/\d/,'').strip.squeeze(' ')
    formatted_string += ' '
    word_length = 0
    word = ''
    formatted_sentence = ''
    formatted_string.each_char do |chr|
      word_length += 1
      word += chr
      if chr == ' '
        formatted_sentence += ' '
        if (word_length - 1).odd?
          formatted_sentence += word.strip.reverse
        else
          formatted_sentence += word.strip
        end
        word = ''
        word_length = 0
      end
    end
    formatted_sentence += '.'
    formatted_sentence.strip.capitalize
  end

end

p OddWords.reverse_odds("typical")