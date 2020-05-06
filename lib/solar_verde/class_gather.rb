require_relative './cli.rb'
require 'pry'
require 'open-uri'

@@key = fGuehaSYTbJB3S3S0p6iwlGCQ0Ps75sGS5QmbjBNVbdVP6OM8c1ZKPjDu2syxSi0

class SolarVerde::Gather

  attr_accessor :locate, :zip

  def self.gather(locate, zip)
    @locate = locate
    @zip = zip
  end

  def zip_to_latlong
    location_obj = https://www.zipcodeapi.com/rest/<api_key>/info.<format>/<zip_code>/<units>
end
