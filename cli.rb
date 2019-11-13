class ConcertFinder
    attr_accessor :customer, :ticket, :flight
    def initialize
        @customer = nil
        @ticket = nil
        @concert = nil
    end
 
    def greetings
        t = Time.now
        if t.strftime('%P') == 'pm'
            puts "\n~~~~~ Welcome to ConcertFinder.com ~~~~~"
        else
            puts "\n~~~~~ Welcome to ConcertFinder.com ~~~~~"
        end
        sleep 2
    end
    def waiting
        print "\nConnecting you with next available agent" 
        sleep 1
        print "."
        sleep 0.75
        print "."
        sleep 0.75
        print "."
        sleep 0.75
        print "."
        sleep 0.75
        print ".\n"
    end
    def add_customer
        
        t = Time.now
        if t.strftime('%P') == 'pm'
            puts "\nBooking Agent: Good afternoon! Thanks for waiting.\n"
        else
            puts "\nBooking Agent: Good morning! Thanks for waiting.\n"
        end
        sleep 2.5
        puts "Booking Agent: What's your name?\n\n"
        customer_name = gets.chomp
        if Customer.find_by(customer_name: customer_name).nil?
            @customer = Customer.create(customer_name: customer_name)
        else 
            @customer = Customer.find_by(customer_name: customer_name)
        end
            sleep 2
            puts "\nBooking Agent: Nice to meet you #{@customer.customer_name}.."
    end
end
