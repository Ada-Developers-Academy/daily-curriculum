require 'date'
class LogParser
  attr_reader :result

  def initialize(path)
    @path = path
    @result = {}
    parse
  end

  def parse
    file.each_line do |line|
      next unless line =~ /Started/
      date = DateTime.parse(line.match(/at ([:\s\d-]+)/)[1]).to_time.to_i
      @result[date] ||= 0
      @result[date] += 1
    end
  end

  def file
    @file ||= File.open(@path)
  end
end

puts LogParser.new("sample.log").result
