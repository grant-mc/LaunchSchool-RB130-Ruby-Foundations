class Trinary
  def initialize(tri_string)
    @tri_num = tri_string
  end

  def to_decimal()
    decimal_num = 0
    return 0 if @tri_num =~ /^[0-2]/

    arr =@tri_num.split('').map(&:to_i).reverse
    arr.each_with_index { |dig, idx| decimal_num += dig * 3 ** idx}
    decimal_num
  end
end