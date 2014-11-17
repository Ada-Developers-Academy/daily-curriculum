require 'httparty' # If using Rails with a Gemfile, this require is not needed
class Weather
  attr_accessor :city
  
  def initialize(city)
    @city = city
  end
  
  #Using HTTParty to get and parse a JSON request
  def current_weather
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}").parsed_response
  end
  
  # Using HTTParty to get, but the JSON library to parse the request
  # There would be no reason to use this approach over the `current_weather` approach
  # They are both in here to demonstrate multiple ways to parse JSON
  def forecast
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city}")
    JSON.parse(response.body)
  end
end