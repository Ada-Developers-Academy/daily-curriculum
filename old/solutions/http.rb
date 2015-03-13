# Create an Http class to convert the following string into a
# Hash with the given rules.

# 1. Separate each element on the & characters.
# 2. Separate key and value on the = character
# 3. [*] indicates a hash as a value, the word preceding the [*] is the key
#    to the value and the word in the [*] is a key within the nested hash.

class Http

  def self.string_to_hash(query_string)
    new_hash   = {}
    inner_hash = {}
    query_string.split("&").each do |group|

      pineapple, mango = group.split("=")
      # pineapple, coconut = pineapple.split("[") # => ["market", "name]"]

      # pineapple => "market[name]"
      matches   = pineapple.match(/(.+)\[(.+)\]/i)
      pineapple = matches[1]
      coconut   = matches[2]

      inner_hash[coconut] = mango
      new_hash[pineapple] = inner_hash

    end
    return new_hash
  end
end

s = "market[name]=Cap Hill Market&market[description]=A good place to buy produce"

# {"market[name]" => "Cap Hill Market", "market[description]" => "A ..."}

# {market: {name: "Cap Hill Market", description: "A good place to buy produce"}}
puts Http.string_to_hash(s).inspect
