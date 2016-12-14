# Make a method that takes a hash
# as an argument and swaps each key with it's value.

a = {name: "Wabi", species: "Cat"}
# [[:name, "Wabi"], [:species, "Cat"]]
# swap(a)
# => {"Wabi" => :name, "Cat" => :species}

def swap(hash)
  new_hash = {}
  hash.keys.each do |k|
    v = hash[k]
    new_hash[v] = k
  end
  new_hash
end

puts swap(a)
