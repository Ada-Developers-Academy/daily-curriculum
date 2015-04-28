output = `ruby ./fizzbuzz.rb`

if output == File.read("fizzbuzz_output.txt")
  puts "SUCCESS"
else
  puts "FAIL"
end
