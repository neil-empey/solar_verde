require_relative './class_gather.rb'
require_relative '../concerns/cli_modules.rb'
require 'pry'

class SolarVerde::CLI
  include ::ConfirmAddress

  attr_accessor :pos_address_string, :prediction, :location, :choice_code, :system_capacity, :azimuth, :tilt, :array_type, :module_type, :losses

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
    if choice_code == "1"
     outputs = AdvancedGather.simple(location)
     puts ""
     puts "    Here is the predicted annual kWhac (kiloWattHours AC) for your system"
     puts ""
     puts "                #{outputs} kWhac"
     puts "                   ---------------"
     p outputs
   elsif choice_code == "2"
     puts ""
     puts "     Please answer the following questions to the best of your ability."
     puts "     -------------------------------------------------------------------"
     puts "     The units will be described in the question. Type 'h' for help. "
     puts "     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
     puts ""
     puts ""
     

     exit(0)
     AdvancedGather.complex(location, system_capacity, azimuth, tilt, array_type, module_type, losses)
   end
   exit(true)
  end
end
