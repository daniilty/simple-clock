Thread.new do

  loop do

    UpdateWeatherJob.perform_later
    sleep 360

  end
end
