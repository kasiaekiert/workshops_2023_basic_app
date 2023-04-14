class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :load_weather
  before_action :load_presenter

  def flash_notice
    I18n.t(:notice, scope: [:controllers, controller_name, action_name])
  end

  def load_weather
    @data = WeatherController.new.show
  end

  def load_presenter
    @presenter ||= WeatherPresenter.new(@data)
  end
end
