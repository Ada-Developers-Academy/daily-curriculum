# Parse how many requests happen each second. Store the result in a hash where the
# datetime (in seconds) is the key and the number of total requests during that second
# is the value.

# Example:
# ```ruby
# {1414078678=>1, 1414078679=>21, 1414078680=>16, 1414078681=>17, 1414078682=>16, 1414078683=>17, 1414078684=>16, 1414078685=>17}
# ```

# Find the time string in the Started line
# Convert string into Time object
# Convert time to seconds and assign to var
# Add time in seconds to key of a hash
# The value is 1
# If the key already exists the value is += 1
require "time"

REGEX = /for \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3} at \d{4}-\d{2}-\d{2}/
def file_open
  File.open("sample.log", "r")
end
def parse
  array = []
  file_open.each_line do |line|
    array << line if line.match REGEX
  end
  array.count
end

TIME_REGEX = /(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} -\d{4})/
def time
  file_open.each_line do |line|
    match = line.match TIME_REGEX
    if match
      seconds = Time.parse(match[1]).to_i
    end
  end
end

puts parse.inspect
