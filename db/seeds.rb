require_relative "../config/environment"

# puts "Please enter zip code"
# user_input = gets.chomp

def api_response_hash
    response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=94107&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")
    response_hash = JSON.parse(response_string)
    response_hash
end


def concert_info
    events = api_response_hash["events"]
    events.each do |event|
        # event["venue"].each do |venue|
        band = event["title"]
        date = event["datetime_utc"]
        venue = event["venue"]["name"]
        address = event["venue"]["address"] + ", " + event["venue"]["display_location"]
        price  = "$" + rand(20..100).to_s
        
        puts "Band: " + band
        puts "Date: " + date
        puts "Venue: " + venue
        puts "Address: " + address
        puts "Price: " + price
        puts
        # end 
        Concert.create(band: band, date: date, venue: venue, address: address, price: price)
    end
end



# instantiate temporary concerts
# thesmiths = Concert.create(band: "The Smiths", date: "2019-11-14", venue: "Slims", address: "11th Street", price: "$20")



# instantiate customers
# will = Customer.create(name: "Will")
# joseph = Customer.create(name: "Joseph")
# arya = Customer.create(name: "Arya")

# instantiate tickets



# def genre_list
#     # events.first["performers"].first["genres"].first["name"]
#     events = api_response_hash["events"]
#     events.each do |event|
#         # puts event["performers"]
#         event["performers"].each do |performer|
#             performer["genres"].each do |genre|
#                 genre["name"]
#             end
#         end
#     end
# end

# genre_list





concert_info

# binding.pry

puts "seed file"

