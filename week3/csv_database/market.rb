require 'csv'

# Reads the CSV file into an array of arrays
# [[Location, City, State, Day, Updated At]]
markets = CSV.read("markets.csv")

markets.each do |market|
  puts market.inspect
end
# Opens the file, and rewrites each value
# In this case we are only updated the last value to the current time
# All of the other values stay the same
CSV.open("markets.csv", 'w') do |row|
  markets.each do |market|
    market[-1] = Time.now
    row << market
  end
end