require 'json'
require 'net/http'
require 'uri'

class WeathersController < ApplicationController
  unloadable


  def index
    uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q="Kobe","Japan"')
    json = Net::HTTP.get(uri)
    # ex)
    # json = '{"coord":{"lon":135.22,"lat":34.7},"sys":{"message":0.0103,"country":"Japan","sunrise":1429992852,"sunset":1430041179},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],"base":"stations","main":{"temp":281.198,"temp_min":281.198,"temp_max":281.198,"pressure":1018.27,"sea_level":1034.35,"grnd_level":1018.27,"humidity":84},"wind":{"speed":1.17,"deg":159.5},"clouds":{"all":0},"dt":1430082145,"id":0,"name":"Kobe-Shi","cod":200}'

    result = JSON.parse(json)
    @weather = result
  end
end