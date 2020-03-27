
class Crypto

  def initialize(string)
    @unencrypted_strg = string
  end

  def plaintext_segments
    segment(normalize_plaintext)
  end

  def normalize_plaintext
    @unencrypted_strg.downcase.gsub(/[^a-z\d]/,'')
  end

  def ciphertext
    plaintext_arr = plaintext_segments
    idx = 0
    cipher_strg = ""

    while idx < size + 1
      plaintext_arr.each { |seg| cipher_strg << seg[idx] unless idx >= seg.length }
      idx += 1
    end

    cipher_strg
  end
    
  def normalize_ciphertext
    padded_segments = plaintext_segments.map { |string| right_pad(string, size) }
    padded_segments.map(&:chars).transpose.map(&:join).map(&:strip).join(' ')
  end

  private_methods

    def segment(text)
      p size
      num = size
      segs = text.scan(/.{#{num}}/)

      remainder = text.gsub(segs.join(''),'')
      segs << remainder unless remainder.empty?

      segs
    end

    def size
      square_size = normalize_plaintext.size
      Math.sqrt(square_size).ceil
    end

    def right_pad(string, size_limit)
      string + ' ' * (size_limit - string.size)
    end

end
  
crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
p crypto.ciphertext