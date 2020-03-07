class Luhn
  attr_reader :num
  def initialize(num)
    @num = num
  end
  
  def valid?
    self.checksum % 10 == 0
  end

  def addends
    check_num = @num.digits.each_with_index.map do |dig, idx|
      idx.odd? ? dig *= 2 : dig
      dig >= 10 ? dig -= 9 : dig
    end

    check_num.reverse
  end

  def checksum
    self.addends.reduce(&:+)
  end

  def self.create(num)
    for i in 0..9
       new_num = Luhn.new((num.digits.reverse << i).join.to_i)
       return new_num.num if new_num.valid?
    end
  end

end

#p Luhn.create(123)