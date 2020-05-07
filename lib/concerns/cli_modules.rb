module ConfirmAddress
  def establish_confirm(choice)
    puts ""
    puts "processing your request, one moment please."
    puts ""
    process1 = SolarVerde::Gather.new(@pos_address_string)
    check = process1.confirm_address[0]
    check.address
    puts "Confirm the address is correct :  #{check.address}"
    puts "---------------------------------"
    puts " Please enter Y or N"
    puts ""
      confirmation = gets.strip.downcase
      case confirmation
      when "y"
        advanced_prediction(check, choice)
      when "n"
        puts ""
        puts "---------------------94536"
        puts "Let's try this again."
        puts "---------------------"
        puts ""
        get_location()
        choices()
        # input = gets.strip
        # @pos_address_string = input
        # SolarVerde::Gather.new(@pos_address_string)
      end
    end
  end
