class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = {}
    test_phrase = @phrase.downcase.gsub(/[^[a-z0-9,'""]\s\\W]/,'').squeeze(' ').split(/[\s,]+/)
    test_phrase.each do |word|
      word.delete!("'") if word.start_with?("'") && word.end_with?("'")
      counts[word] = test_phrase.count(word)
    end
    counts
  end

end

Phrase.new("car : carpet as java don't : javascript!!&@$%^& 99999").word_count