require_relative '../config/environment.rb'
require_relative '../cli.rb'

nc = ConcertFinder.new
user_input = nil

until user_input == "quit"
# if user_input == "quit"
    nc.greetings
    # sleep 5
    nc.waiting
    # sleep 3
    nc.add_customer
    # sleep 3
    # nc.returning_customer
    # sleep 3
    nc.zip_code
    # sleep 3
    nc.create_new_ticket_from_user
    # sleep 3
    # nc.return_user_ticket_confirmation
    puts "test"
    # sleep 3
    puts "\nBooking Agent: Would you like to purchase another ticket? 'Yes' or 'No'\n\n"
    user_input= gets.chomp.downcase
    if user_input == 'no' or user_input == "exit" or user_input == "quit"
        break
    end
    # nc.zip_code
end
