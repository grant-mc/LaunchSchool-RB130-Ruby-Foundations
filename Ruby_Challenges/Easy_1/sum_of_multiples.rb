require 'pry'

class SumOfMultiples
  
  def self.to(limit, multiples = [3,5])
    sum = 0
    limit -= 1
    arr = (1..limit).to_a
    arr.each do |n|
      multiples.each do |dig|
        if n % dig == 0
          sum += n
          break
        end
      end
    end
    sum
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    self.class.to(limit, @multiples)
  end

end

SumOfMultiples.to(10)