class WeatherPresenter
  attr_reader :description, :temperature, :icon

  def initialize(data)
    @description = data.dig('current', 'condition', 'text')
    @temperature = data.dig('current', 'temp_c')
    @icon = data.dig('current', 'condition', 'icon')
  end

  def encourage_text
    if good_to_read_outside?
      "Get some snacks and go read a book in a park!"
    else
      "It's always a good weather to read a book!"
    end
  end

  private

  attr_reader :data

  def nice_weather?
    description == 'Sunny' || description == 'Partly cloudy'
  end

  def good_to_read_outside?
    nice_weather? && temperature.to_f > 15
  end
end
