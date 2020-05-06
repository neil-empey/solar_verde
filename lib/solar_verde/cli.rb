class SolarVerde::CLI

  def call
    puts ""
    puts ""
    puts "-------------------------------------"
    puts "Welcome to the solar output estimator"
    puts "-------------------------------------"
    get_location
  end

  def get_location
    puts ""
    puts "Please enter your 5 digit zip"
    puts "-----------------------------"

    input = gets.strip
    p input
  end

  def choices
    puts "Please select one of the options below"
    puts "--------------------------------------"
    puts ""
    
end
