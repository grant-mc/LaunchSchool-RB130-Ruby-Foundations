class SecretHandshake
  COMMANDS = {
      0 => 'reverse',
      1 => 'jump',
      2 => 'close your eyes',
      3 => 'double blink',
      4 => 'wink'
  }

  def initialize(input)
    @num = input
  end

  def commands
    command_arr = []
    return command_arr if @num.to_s.match(/\D/)
    
    command_bin = @num.to_i.digits(2).reverse
    (5 - command_bin.size).times { command_bin.unshift(0) } if command_bin.size < 5
    command_bin.each_with_index { |dig, idx| command_arr << COMMANDS[idx] if dig > 0 }
    
    command_arr.reverse! unless command_arr[0] == 'reverse'
    command_arr.delete('reverse')
    command_arr
  end

end