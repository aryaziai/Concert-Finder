require_relative '../config/environment.rb'
require_relative '../cli.rb'

nc = ConcertFinder.new
user_input = nil

until user_input == "quit"
    nc.greetings
    sleep 3
    nc.waiting
    sleep 3
    nc.add_customer
    sleep 3
    nc.returning_customer
    sleep 3
    nc.zip_code
    # Enter API hash method -> concert instantiation method -> create concert rows -> adds to concert_array -> display_concerts_select method -> select_concert method ->
    nc.create_new_ticket_from_user
     sleep 3
    puts "\nBooking Agent: Would you like to purchase another ticket? 'Yes' or 'No'\n\n"
    user_input= gets.chomp.downcase
    if user_input == 'no' or user_input == "exit" or user_input == "quit"
        puts "\nBooking Agent: Goodbye!\n\n"
        sleep 2
        break
    end
    nc.zip_code
    nc.create_new_ticket_from_user

end
