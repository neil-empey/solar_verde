class SolarVerde::CLI
  attr_accessor :option, :pos

  def call
    puts ""
    puts ""
    puts "-------------------------------------"
    puts "Welcome to the solar output estimator"
    puts "-------------------------------------"

    option = choices()
    pos = get_location()
    SolarVerde::Solar.new(option, pos)

  end

  def get_location
    puts ""
    puts "Please enter your 5 digit zip"
    puts "-----------------------------"

    input = gets.strip
    p input
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
        puts "procesing your request, one moment please."
        return 2
      when "1"
        puts ""
        puts "processing your request, one moment please."
        puts ""
        return 1
      when "3"
        puts "Come back soon."
        return 3
      end
    end
  end




end
