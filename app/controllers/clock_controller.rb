class ClockController < ApplicationController
  def index
    @weather = Weather.first.current
  end
end
