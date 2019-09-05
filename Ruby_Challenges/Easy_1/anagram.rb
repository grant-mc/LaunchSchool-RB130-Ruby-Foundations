class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(comparators)
    anagrams = []
    comparators.each do |comp|
      comp_word = comp.downcase
      a = @word.split('').sort.join('')
      b = comp_word.split('').sort.join('')
      anagrams << comp if a == b && @word != comp_word
    end
    anagrams
  end
end