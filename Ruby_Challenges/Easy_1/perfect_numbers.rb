class PerfectNumber
  def self.classify(limit)
    raise RuntimeError if limit < 0
    factors = []
    (1..limit - 1).to_a.each { |num| factors << num if limit % num == 0}
    sum = factors.reduce(&:+)
    case 
      when sum == limit then return "perfect"
      when sum > limit then return "abundant"
      else
        return "deficient"
    end

  end

end

