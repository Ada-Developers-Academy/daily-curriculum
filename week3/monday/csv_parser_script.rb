require 'csv'

CSV.open("markets.csv").each do |row|
  if row[0].to_i > 10
    puts row.inspect
  end
end

puts "-" * 80
markets = CSV.read('markets.csv')

puts markets.first.inspect
puts "-" * 80

mass_markets = markets.select do |market|
  market[5] == "Massachusetts"
end

puts mass_markets.inspect

puts "-" * 80

cambridge = markets.find do |market|
  market[3] == "Cambridge"
end

puts cambridge.inspect


