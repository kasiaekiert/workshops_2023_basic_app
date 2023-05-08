class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :load_weather_data
  before_action :load_presenter

  def flash_notice
    I18n.t(:notice, scope: [:controllers, controller_name, action_name])
  end

  def load_weather_data
    @data = WeatherApiConnector.new.weather_data
  end

  def load_presenter
    @presenter ||= WeatherPresenter.new(@data)
  end
end
