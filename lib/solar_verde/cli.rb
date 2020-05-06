require_relative './class_gather.rb'
require 'pry'

class SolarVerde::CLI
  attr_accessor :option_array, :pos_zip_string



  def initialize
    @option_array = []
    @pos_zip_string = ""
    call
  end

  def option_array
    @option_array
  end

  def pos_zip_string
    @pos_zip_string
  end

  def call
    puts ""
    puts ""
    puts "-------------------------------------"
    puts "Welcome to the solar output estimator"
    puts "-------------------------------------"
    get_location
    choices
  end

  def get_location
    puts ""
    puts "Please enter your 5 digit zip"
    puts "-----------------------------"

    input = gets.strip
    p input
    @pos_zip_string = input
  end

  def choices

    puts "Select an option below by entering its corresponding number"
    puts "--------------------------------------"
    puts ""
    puts "1. A yearly predicted output precentage"
    puts ""
    puts "2. A selected monthly output percentage"
    puts ""
    puts "3. Exit"
    puts ""

    response = nil
    while response != "3"
      response = gets.strip
      p response
      case response
      when "2"
        puts "Enter a month, (i.e January, user would enter 1)"
        puts ""
        month = gets.strip
        puts ""
        puts "procesing your request, one moment please."
        @option_array << 2
        @option_array << month
        SolarVerde::Gather.gather(@option_array, @pos_zip_string)
      when "1"
        puts ""
        puts "processing your request, one moment please."
        puts ""
        @option_array << 1
        SolarVerde::Gather.gather(@option_array, @pos_zip_string)
      when "3"
        puts "Come back soon."
        return
      end
    end
  end

  # def add_data(locate, zip)
  #   @data_to_analyze = SolarVerde::Gather.gather(locate, zip)
  # end


end
