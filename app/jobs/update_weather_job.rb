class UpdateWeatherJob < ApplicationJob
  queue_as :default
  def perform(*args)
      @doc = HTTParty.get("https://www.gismeteo.ru/")
      @page = Nokogiri::HTML(@doc)
string = ""
      string1 = ""
      @page.xpath('//span[@class = "value unit unit_temperature_c"]').each do |el|
        string += el.text
      end
      @page.xpath('//div[@class = "description gray"]').each do |el|
        string1 += el.text
      end
    string = string.split(' ')[0] + ' ' + string1.split(' ')[0]
    if Weather.first.nil?
        Weather.create(current: nil)
    end
    @weather = Weather.first
    @weather.current = string
    @weather.save
  end
end
