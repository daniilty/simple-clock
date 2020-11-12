class ClockController < ApplicationController
  def index
    UpdateWeatherJob.perform_later
    @weather = Weather.first.current
  end
end
