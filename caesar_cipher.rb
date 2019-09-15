class CaesarCipher
  def cipher(string, key)
    arr2 = string.chars.map do |e|
      if alphabet_upcase.include?(e)
        shift(alphabet_upcase, e, key)
      elsif alphabet_downcase.include?(e)
        shift(alphabet_downcase, e, key)
      else
        e
      end
    end
    arr2.join
  end

  private
  def alphabet_upcase
    ('A'..'Z').to_a
  end

  def alphabet_downcase
    ('a'..'z').to_a
  end

  def shift(alphabet, e, key)
    alphabet[(alphabet.index(e) + key)%26]
  end
end


puts CaesarCipher.new.cipher("Anna Olak... SUPER!", 2)
