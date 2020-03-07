class PigLatin
  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word += "ay"
    else
      cons = word.slice(0,1)
      word.slice!(0,1) 
      word += cons += "ay"
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.translate(strg)
    strg.split(' ').map do |word|
      self.translate_word(word)
    end.join(' ')
    

  end

end

p PigLatin.translate('apple')
p PigLatin.translate('quick fast run')