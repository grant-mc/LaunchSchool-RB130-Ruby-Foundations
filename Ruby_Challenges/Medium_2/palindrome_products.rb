class Palindromes
  attr_reader :value, :factors

  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |factor_1, factor_2|
      product = factor_1 * factor_2
      if @palindromes.empty? || product < smallest_val || product >= largest_val
        @palindromes[product] << [factor_1, factor_2] if palindrome?(product)
      end

    end
  
  end

  def largest
    Struct.new(:value, :factors).new(largest_val, @palindromes[largest_val])
  end

  def smallest
    Struct.new(:value, :factors).new(smallest_val, @palindromes[smallest_val])
  end

  private_methods

   def largest_val
    @palindromes.keys.max
   end

   def smallest_val
    @palindromes.keys.min
   end

   def palindrome?(num)
    num == num.digits.join.to_i
   end


end


