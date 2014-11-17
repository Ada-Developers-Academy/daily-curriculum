require 'httparty' # If using Rails with a Gemfile, this require is not needed
class Weather
  attr_accessor :city

  def initialize(city)
    @city = city
  end

  def current_weather
    request("weather")
  end

  def forecast
    request("forecast")
  end

  def request(path)
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/#{path}?q=#{@city}")
    response.parsed_response
  end
end
