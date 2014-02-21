require 'httparty'
class Weather
  def initialize(city)
    @city = city
    @weather = get_weather
  end
  
  def description
    @weather["weather"][0]["description"]
  end
  
  private
  
  def get_weather
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@city}")
  end
end

describe Weather do
  let(:weather) { {"weather" => [{"id" => 500,"main" => "Rain","description" => "light rain","icon" => "10d"}],"base" => "cmc stations"}}

  # This is a stub
  it "returns the weather" do
    HTTParty.stub(:get).with("http://api.openweathermap.org/data/2.5/weather?q=London,uk") { weather }
    expect(Weather.new("London,uk").description).to eq "light rain"
  end  
  
  # This is a mock
  it "returns the weather" do
    weather_data = double("weather_data")
    Weather.any_instance.stub(:get_weather) { weather_data }
    expect(weather_data).to receive(:[]).with("weather")     { weather_data }
    expect(weather_data).to receive(:[]).with(0)             { weather_data }
    expect(weather_data).to receive(:[]).with("description") { weather_data }
    Weather.new("London,uk").description
  end
end
