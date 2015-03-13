# Basic Mocks and Stubs

Mocks and stubs are both considered Test Doubles, which is the general term used to describe pretend objects used for testing. Here is Martin Fowlers description of mocks and stubs from his article [Mocks Aren't Stubs](http://martinfowler.com/articles/mocksArentStubs.html)

- **Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test. Stubs may also record information about calls, such as an email gateway stub that remembers the messages it 'sent', or maybe only how many messages it 'sent'.
- **Mocks** are objects pre-programmed with expectations which form a specification of the calls they are expected to receive.

Let's give a couple quick examples, given the code:

```ruby
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
```
```ruby
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
```
    
## Stubs

Stubs allow us to override a method for an object (real or a test double) and return any value that we determine. For example if we want to stub an api call so that the data we recieve is always the same and so that we don't have to rely on the external service. In the above code you can see that I'm "stubbing" the response of HTTP, then checking the state of the `Weather` object


## Mocks

In the mock, I am using a stub, just to accomplish using the mock. When using a mock, you use a behavioral driven test, opposed to state driven. This means that we check that our class uses our mock object in the way we would expect.
