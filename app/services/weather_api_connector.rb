require 'net/http'

class WeatherApiConnector
  API_KEY = A9n.weather_api_key
  LOCATION = 'Cracow'.freeze

  def weather_data 
    JSON.parse(response) 
  end 
  
  private 
  def response 
    Net::HTTP.get(uri)
  end 
  
  def uri 
    URI("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{LOCATION}")
  end
end
