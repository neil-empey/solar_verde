require_relative './cli.rb'
require 'httparty'

class AdvancedGather
  include HTTParty
  format :json

  attr_accessor :location, :choice_code

  @@all = []

  def initialize(location, choice_code)
    @location = location
    @choice_code = choice_code
    @@all << self
    simple(location)
  end

  def self.all
    @@all
  end

  def simple(locate)
    #p @location
    #azimuth will be set @ default of 180 degrees(south)
    #system_capicity will be set @ 4kW
    #tilt will be defaulted @ 30.26 degrees (roof pitch)
    #array type will be defaulted @ 1 (roof mounted)
    #module type will be defaulted @ 0 (standard)
    #system loses defaulted to 14%
      response = HTTParty.get("https://developer.nrel.gov/api/pvwatts/v6.json?api_key=kPvYh2OjCIVqR4y0VLpZDKuJB1cM9u8CfdmbeeTk&lat=#{locate[0]}&lon=#{locate[1]}&system_capacity=4&azimuth=180&tilt=30.26&array_type=1&module_type=0&losses=14")

      p response
      exit(true)

  end



end
