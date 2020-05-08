module ConfirmAddress
  def establish_confirm(choice)
    puts ""
    puts "   processing your request, one moment please..."
    puts ""
    process1 = SolarVerde::Gather.new(@pos_address_string)
    check = process1.confirm_address[0]
    check2 = process1.confirm_address[1]
    check.address
    puts "   Confirm the address is correct :  #{check.address}"
    puts "   --------------------------------""  ""::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    puts ""
    puts "       Please enter (Y) or (N)"
    puts ""
      confirmation = gets.strip.downcase
      case confirmation
      when "y"
        puts ""
        advanced_prediction(check2, choice)
      when "n"
        puts ""
        puts "     ---------------------"
        puts "     Let's try this again."
        puts "     ---------------------"
        puts ""
        get_location()
        choices()
      end
    end
  end
