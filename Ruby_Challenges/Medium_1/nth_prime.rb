

class Prime

  def self.nth(num)
    raise ArgumentError if num == 0
    primes = [2]
    current = 3
    until primes.size == num
      primes << current if self.is_prime?(current)
      current += 1
    end
    primes.last

  end

  def self.is_prime?(n)
    (2..Math.sqrt(n)).each { |divr| return false if n % divr == 0 }
  end

end

