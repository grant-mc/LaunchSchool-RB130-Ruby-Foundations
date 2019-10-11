class Scrabble
  LETTER_VALUES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)

  }
  def self.score(string)
    new(string).score
  end

  def initialize(string)
    @word = string
  end

  def score
    return 0 if (@word == nil || @word.match?(/[\W\d]/) || @word == '')
    scrabble_word = @word.upcase
    score = 0
    scrabble_word.each_char do |chr|
      LETTER_VALUES.each do |k,v|
        if v.include?(chr)
          score += k
          break
        end
      end
    end
    score
  end

end


