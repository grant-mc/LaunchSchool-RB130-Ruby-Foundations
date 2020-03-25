class Crypto

  def initialize(string)
    @unencrypted_strg = string
  end

  

  public_methods

    def normalize_plaintext
      plain_text = @unencrypted_strg.downcase.gsub(/[^a-z\d]/,'')
    end

    def plaintext_segments
      num = size.to_i
      plain_text = normalize_plaintext
      plaintext_segs = plain_text.scan(/.{#{num}}/)

      remainder = plain_text.gsub(plaintext_segs.join(''),'')
      plaintext_segs << remainder unless remainder.empty?

      plaintext_segs
    end

    def size
      square_size = normalize_plaintext.size
      square_size += 1 until Math.sqrt(square_size) % 1 == 0
      Math.sqrt(square_size)
    end
    

end
  
