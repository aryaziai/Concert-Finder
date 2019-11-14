class ConcertFinder
    require 'pry'
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
      \____/\___/|_| |_|\___\___|_|   \__|
                                          
         ___ _           _           
        / __(_)_ __   __| | ___ _ __ 
       / _\ | | '_ \ / _` |/ _ \ '__|
      / /   | | | | | (_| |  __/ |   
      \/    |_|_| |_|\__,_|\___|_|   
      \n\nWelcome To ConcertFinder.com!"
    end

    def waiting
        t = Time.now  
        print "\nConnecting you with next available agent" 
        # wait
        t.strftime('%P') == 'pm' ? greet = "afternoon" : greet = "morning"
        puts "\n#{@b} Good #{greet}! Thanks for waiting."
    end

    def wait #helper method
        5.times do 
            print "."
            sleep 0.5
        end
    end

    def add_customer
        puts "#{@b} What's your name?\n\n"
        @n = gets.chomp
        #@new_customer = Customer.create(name: n) #just use instance variable. and run this code after email is inputted
        #sleep 2
        puts "#{@b} Nice to meet you #{@n}.."
    end



    # think about renaming this method to ask if returning customer or something similar
    def returning_customer
        puts "#{@b} Do you have an existing account with us? 'Yes' or 'No'\n\n"
        answer = gets.chomp.downcase
        if answer == "yes"
            puts "#{@b} Please type username:\n\n"
            username_input = gets.chomp.downcase
            binding.pry
            if username_input == Customer.find_by(username: username_input).username
                puts "#{@b} Welcome back #{username_input}"
            else 
                puts "#{@b}We couldn't find #{username_input}, so we created a new account!"
                Customer.create(username: username_input, name: @n)
            end
        elsif answer == "no"
            create_username
        else 
            puts "#{@b} I don't understand. Please try again.."
            sleep 2
            returning_customer
        end
    end



    def create_username #helper method
        puts "#{@b} Please create username:\n\n"
        username_input = gets.chomp.downcase
        if username_input == Customer.find_by(username: username_input).username
            puts "#{@b} Sorry #{username_input} is taken. Please try again.."
            sleep 2
            create_username
        else
            Customer.create(username: username_input, name: @n)
            puts "#{@b} #{username_input} is available!"
        end
    end
                
        
end
  