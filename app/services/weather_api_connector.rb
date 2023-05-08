require 'net/http'

class WeatherApiConnector
  API_KEY = 'cda935de2a524f0284372551231404'
  LOCATION = 'Cracow'

  def weather_data
    url = "http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{LOCATION}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
  end
end
