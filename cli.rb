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
        n = gets.chomp
        @customer = Customer.find_or_create_by(name: n)
        sleep 2
        puts "#{@b} Nice to meet you #{@customer.name}.."
    end


end
