class PhoneNumber

  BAD_NUM = '0000000000'

  def initialize(string)
    @phone_num = string
  end

  def number
    return BAD_NUM if @phone_num.length > 11 && @phone_num.match(/[a-z]/)
    
    num = @phone_num.gsub(/\D/,'')
    return BAD_NUM if num.length < 10 || num.length > 11
    
    if num.length == 11 && num[0] == '1'
      return num.slice(1..num.length - 1)
    elsif num.length == 11
      return BAD_NUM
    end

    num
  end

  def area_code
    return self.number.slice(0, 3)
  end

  def to_s
    num = self.number
    num = '(' + self.area_code + ')' + ' ' + num.slice(3,3) + '-' + num.slice(6,4)
    return num
  end

end