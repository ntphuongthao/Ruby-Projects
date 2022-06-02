# require 'pry-byebug'

def substrings(word, dictionary)
  store = Hash.new(0)
  dictionary.each do |w|
    store[w] += 1
  end

  res = Hash.new(0)

  for i in 0..word.length - 1 do
    for j in i + 1..word.length do
      substr = word[i..j-1]
      res[substr] += store[substr]
    end
  end

  res.select {|k, v| v > 0}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
res = substrings("Howdy partner, sit down! How's it going?", dictionary)
puts res
