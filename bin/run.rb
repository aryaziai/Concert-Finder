require_relative '../config/environment.rb'
require_relative '../cli.rb'

nc = ConcertFinder.new
user_input = nil

until user_input == "quit"
    nc.greetings
    # sleep 5
    nc.waiting
    # sleep 3
    nc.add_customer
    # sleep 3
    nc.returning_customer
    puts "\nBooking Agent: Would you like to purchase another ticket? 'Yes' or 'No'\n\n"
    user_input= gets.chomp.downcase
    if user_input == 'no' or user_input == "exit" or user_input == "quit"
        break
    end
end
