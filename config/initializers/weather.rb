Thread.new do

  loop do

    UpdateWeatherJob.perform_async
    sleep 360

  end
end
