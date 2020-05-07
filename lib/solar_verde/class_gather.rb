require_relative './cli.rb'
require 'pry'
require 'opencage/geocoder'
#NREL api_key kPvYh2OjCIVqR4y0VLpZDKuJB1cM9u8CfdmbeeTk
#PVWatts request url GET /api/pvwatts/v6.format?parameters

class SolarVerde::Gather

  attr_accessor :address_string

  @@address = []

  def initialize(address_string)
    @address_string = address_string
    @@address << self
    zip_to_latlong(address_string)
  end

  # def self.gather(address_string)
  #   @address_string = address_string
  #   p self.new.zip_to_latlong(address_string)
  #   @@address << self
  # end

  def zip_to_latlong(address)
    geocoder = OpenCage::Geocoder.new(api_key: '464d424f001944f28f7633d199bada6b')
    results = geocoder.geocode(address)
    p results.first
    results.first.coordinates
  end

  def self.address
    @@address
  end

  def confirm_address

  end 


end
