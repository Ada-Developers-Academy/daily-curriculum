require 'httparty'
class Weather
  def initialize(city)
    @city = city
    @weather = get_weather
    email
  end
  
  def description
    @weather["weather"][0]["description"]
  end
  
  def email(email_address)
    WeatherMailer.send_report(email_address).deliver
  end
  
  private
  
  def get_weather
    
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{@city}")
  end
end

describe Weather do
  let(:weather) { {"weather" => [{"description" => "light rain"}]}}

  # it "returns the weather" do
  #   expect(Weather.new("Seattle").description).to eq "overcast clouds"
  # end


  # This is a stub
  it "returns the weather" do
    HTTParty.stub(:get) { weather }
    expect(Weather.new("London,uk").description).to eq "light rain"
  end  
  
  # This is a mock
  it "returns the weather" do
    weather_data = double("data")
    Weather.any_instance.stub(:get_weather) { weather_data }
    expect(weather_data).to receive(:[]).with("weather")     { weather_data }
    expect(weather_data).to receive(:[]).with(0)             { weather_data }
    expect(weather_data).to receive(:[]).with("description") { weather_data }
    Weather.new("London,uk").description
  end
end
