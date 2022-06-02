require 'pry-byebug'

def is_lower?(c)
  c >= 'a' && c <= 'z'
end

def is_upper?(c)
  ! is_lower?(c)
end


def letter?(lookAhead)
  lookAhead.match?(/[[:alpha:]]/)
end

def caesar_cipher(string, shift)
  alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 
'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 
's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  res = []
  string = string.split('')
  string.each do |c|
    if letter?(c)
      if is_upper?(c) 
        res.push(alphabet[(alphabet.find_index(c.downcase) + shift % 26) % 26].upcase)
      else
        res.push(alphabet[(alphabet.find_index(c) + shift % 26) % 26])
      end
    else
      res.push(c)
    end
  end
  res.join
end

res = caesar_cipher("What a string!", 5)
puts res