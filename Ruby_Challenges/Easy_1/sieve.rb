require 'prime'
class Sieve
  def initialize(num)
    @number = num
    rnge = (2..num).to_a
    @primes = {}
    rnge.each {|dig| @primes[dig] = true}
  end

  def is_prime?(num)
    idx = num - 1
    while idx > 1
      return false if num % idx == 0
      idx = idx- 1
    end
    return true
  end

  def primes
    prime_nums = []
    @primes.each_key do |key|
      break if (key ** 2) > (@primes.size + 1)
      if @primes[key] == true
        (key..@number).step(key) { |num| @primes[num] = false if !(is_prime?(num)) }
      end
    end
    @primes.each { |k, v| prime_nums << k if v == true }
    prime_nums
  end
end

s = Sieve.new(10)
