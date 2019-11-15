require_relative "config/environment"
require "rest-client"
require 'json'
require 'pry'


class ConcertFinder
    attr_accessor :customer, :ticket, :concert

    def initialize
        @customer = nil
        @ticket = nil
        @concert = nil
        @b = "\nBooking Agent:"
    end
 
    def greetings
        puts "
        ___                          _   
        / __\___  _ __   ___ ___ _ __| |_ 
       / /  / _ \| '_ \ / __/ _ \ '__| __|
      / /__| (_) | | | | (_|  __/ |  | |_ 
      \____/\___/|_| |_|\___\___|_|   \__|"
    # sleep 2.6
    puts "
         ___ _           _           
        / __(_)_ __   __| | ___ _ __ 
       / _\ | | '_ \ / _` |/ _ \ '__|
      / /   | | | | | (_| |  __/ |   
      \/    |_|_| |_|\__,_|\___|_|   "
    # sleep 2
    puts "\n\nWelcome To ConcertFinder.com!"                                      
    end

    def waiting
        t = Time.now  
        print "\nConnecting you with next available agent" 
        wait
        t.strftime('%P') == 'pm' ? greet = "afternoon" : greet = "morning"
        puts "\n#{@b} Good #{greet}! Thanks for waiting."
    end

    def wait
        # 5.times do 
        #     print "."
        #     sleep 0.5
        # end
    end

    def add_customer
        puts "#{@b} What's your name?\n\n"
        @n = gets.chomp
        puts "#{@b} Nice to meet you #{@n}.."
    end


    def returning_customer
        puts "#{@b} Do you have an existing account with us? 'Yes' or 'No'\n\n"
        answer = gets.chomp.downcase
        if answer == "yes"
            puts "#{@b} Please type username:\n\n"
            username_input = gets.chomp.downcase
            if Customer.find_by(username: username_input)
                self.customer = Customer.find_by(username: username_input)
                # binding.pry
                puts "#{@b} Welcome back #{username_input}!"
            else 
                puts "#{@b}We couldn't find #{username_input}, so we created a new account!"
                self.customer = Customer.create(username: username_input, name: @n)
            end
        elsif answer == "no"
            create_username
        else 
            puts "#{@b} Sorry I don't understand. Please try again.."
            sleep 2
            returning_customer
        end
    end



    def create_username #helper method
        puts "#{@b} Please create username:\n\n"
        username_input = gets.chomp.downcase
        if Customer.find_by(username: username_input)
            puts "#{@b} Sorry #{username_input} is taken. Please try again.."
            sleep 2
            create_username
        else
            self.customer = Customer.create(username: username_input, name: @n)
            puts "#{@b} #{username_input} is available! Account has been created."
        end
    end




    




    def zip_code 
        puts "#{@b} Please type zip code to find upcoming concerts:\n\n"
        zip_code_input = gets.chomp
            if zip_code_input.length != 5
                puts "#{@b} Sorry, we need a 5 digit U.S. zip code"
                sleep 2
                zip_code
            else 
                api_response_hash(zip_code_input.to_i)
            end
    end


    def api_response_hash(zip_code_input)
        response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=#{zip_code_input}&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")
        response_hash = JSON.parse(response_string)
        # binding.pry
        concert_instantiation(response_hash)
        

    end

   
    
    # Populates our DB & global concert_array
    def concert_instantiation(response_hash)
        events = response_hash["events"]
        $concert_array = []

        events.each do |event|
            # event["venue"].each do |venue|
            band = event["title"]
            date = event["datetime_utc"]
            venue = event["venue"]["name"]
            address = event["venue"]["address"] + ", " + event["venue"]["display_location"]
            price  = "$" + rand(20..100).to_s
            
            # puts "Band: " + band
            # puts "Date: " + date
            # puts "Venue: " + venue
            # puts "Address: " + address
            # puts "Price: " + price
            # puts
            # end 

            concert = Concert.create(band: band, date: date, venue: venue, address: address, price: price)

            $concert_array << concert

        end
        display_concerts_select($concert_array)
    end



  
        
    

    def display_concerts_select(concert_array)
        band_str = "BAND"
        date_str = "DATE"
        venue_str = "VENUE"
        address_str = "ADDRESS"
        price_str = "PRICE"
        justified_chars = 30
    
        # PUTS THE CONCERT INFO HEADER ONCE
        puts "#  #{band_str.ljust(justified_chars)} | #{date_str.ljust(justified_chars)} | #{venue_str.ljust(justified_chars)} | #{address_str.ljust(justified_chars)} | #{price_str.ljust(justified_chars)}"
    
        # my_concerts = Concert.all.select {|c| c.customer == self.customer}
        # binding.pry

        # PUTS EACH CONCERT INFO IN ROWS
        concert_array.each_with_index do |concert, index|
            puts "#{index + 1}. #{concert.band.ljust(justified_chars)} | #{concert.date.ljust(justified_chars)} | #{concert.venue.ljust(justified_chars)} | #{concert.address.ljust(justified_chars)} | #{concert.price.ljust(justified_chars)}"
        end

        # select_concert
    end
        
    def select_concert
        puts "#{@b} Please type number for your concert:"
        concert_input = gets.chomp.to_i
            # if concert_input.length != 1 || concert_input.length != 2
            #     puts "#{@b} Sorry I don't understand. Please try again.."
            #     sleep 2
            #     select_concert
            # end 
        user_selection_number = concert_input - 1
    end

    def create_new_ticket_from_user
        # puts "CLI line 195"
        # puts "Global concert_array: ", $concert_array

        # Ticket.create(customer_id: 4, concert_id: 3)

        
        concert_instance = $concert_array[select_concert]
        # puts "concert_instance.id: ", concert_instance.id
        
        #gives customer obj
        
        # puts "CONCERT INSTANCE: ", concert_instance
        
        # customer_id = returning_customer.id
        # puts "CUSTOMER ID: ", customer.id
        Ticket.create(customer_id: customer.id, concert_id: concert_instance.id)
        return_user_ticket_confirmation
    end

    def return_user_ticket_confirmation
        puts "You have successfully purchased ticket"
    end

    







end # end of class
  