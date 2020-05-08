require_relative './class_gather.rb'
require_relative '../concerns/cli_modules.rb'
require 'pry'

class SolarVerde::CLI
  include ::ConfirmAddress

  attr_accessor :pos_address_string

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
    puts "       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts "       -------------------------------------"
    puts "       Welcome To The Solar Output Estimator"
    puts "       -------------------------------------"
    puts "       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts ""
    get_location
    choices
  end

  def get_location
    puts ""
    puts "     Please enter your address, street, city, state"
    puts "     ----------------------------------------------"
    puts ""
    puts ""

    input = gets.strip
    @pos_address_string = input
  end

  def choices
    puts ""
    puts "    -----------------------------------------------------------"
    puts "    Select an option below by entering the corresponding number"
    puts "    -----------------------------------------------------------"
    puts ""
    puts "  1. Simple yearly predicted output precentage"
    puts ""
    puts "  2. Advanced prediction, requires short guided questionnaire"
    puts "     monthly and yearly predictions available in this mode"
    puts ""
    puts "  3. Exit"
    puts ""

    response = nil
      response = gets.strip
      if response == "2" || response == "1"
        self.establish_confirm(response)
      elsif response == "3"
        puts "  Come back soon."
        puts "    tell your friends..... ;)"
        exit(true)
      else
        puts ""
        puts "---------------------------------"
        puts " Invalid choice, please try again."
        get_location()
        choices()
      end
    end

  def advanced_prediction(location, choice_code)
    prediction = AdvancedGather.new(location, choice_code)
  end
end
