require 'pry'

ENCRYPTED_PIONEERS = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu',
]

ALPHABET = ('a'..'z').to_a

def decrypt(names)
  names.map do |name|
    name = name.downcase.split('')
    revealed_name = ''
    name.each_with_index do |char, i|
      if char != ' ' && char != '-'
        reveal_index = ALPHABET.index(char) + 13
        reveal_index -= 26 if reveal_index > 25
        revealed_char = ALPHABET[reveal_index]
        revealed_name << revealed_char
      else
        revealed_name << char
      end
    end
    name = capitalized(revealed_name)
  end
end

def capitalized(name)
  cap_name = ''
  split_name = name.split('')
  split_name.each_with_index do |char, i|
    if (i == 0) || (name[i -1] == '-') || (name[i -1] == ' ')
      cap_name << char.upcase
    else
      cap_name << char
    end
  end
  cap_name
end

p decrypt(ENCRYPTED_PIONEERS)
