class Octal
  def initialize(string)
    @octal_num = string
  end

  def to_decimal()
    decimal_num = 0
    return 0 if @octal_num =~ /\D|[8-9]/

    arr =@octal_num.split('').map(&:to_i).reverse
    arr.each_with_index { |dig, idx| decimal_num += dig * 8 ** idx}
    decimal_num
  end
end

Octal.new('1234').to_decimal