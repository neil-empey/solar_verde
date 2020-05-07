require_relative './class_gather.rb'
require_relative '../concerns/cli_modules.rb'
require 'pry'

class SolarVerde::CLI
  include ::ConfirmAddress

  attr_accessor :option_array, :pos_address_string

  def initialize
    @pos_address_string = ""
    call
  end

  def pos_zip_string
    @pos_address_string
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
    puts "Please enter your address, street, city, state"
    puts "----------------------------------------------"

    input = gets.strip
    @pos_address_string = input
  end

  def choices

    puts "Select an option below by entering its corresponding number"
    puts "-----------------------------------------------------------"
    puts ""
    puts "1. Simple yearly predicted output precentage"
    puts ""
    puts "2. Advanced prediction, requires short guided questionaire"
    puts "   monthly and yearly predictions available in this mode"
    puts ""
    puts "3. Exit"
    puts ""

    response = nil
    while response != "3"
      response = gets.strip
      if response == "2" || "1"
        self.establish_confirm(response)
        # advanced_prediction(confirmed_location, response)
      # when "1"
      #   confirmed_location = self.establish_confirm
      #     advanced_prediction(confirmed_location, response)
        # process1 = SolarVerde::Gather.new(@pos_address_string)
        # check = process1.confirm_address[0]
        # check.address
        #  puts "Confirm the address is correct :  #{check.address}"
        # puts "---------------------------------"
        # puts " Please enter Y or N"
        # puts ""
        # confirmation = gets.strip.downcase
        #   case confirmation
        #   when "y"
        #     SolarVerde::AdvancedGather.new(process[1])
        #   when "n"
        #     puts "Let's try again. Please enter your address."
        #     puts "-------------------------------------------"
        #     puts ""
        #     input = gets.strip
        #     @pos_address_string = input
        #     SolarVerde::Gather.new(@pos_address_string)
        #   end
      elsif response == "3"
        puts "Come back soon."
        return
      else
        puts "Invalid choice, please try again."
      end
    end
  end

  def advanced_prediction(location, choice_code)
    puts "yeah"
  end


end
