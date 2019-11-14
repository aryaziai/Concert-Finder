require_relative "../config/environment"

# will = Customer.create(name: "Will")
# joseph = Customer.create(name: "Joseph")
# arya = Customer.create(name: "Arya")

# thesmiths = Concert




# puts "Please enter zip code"
# user_input = gets.chomp


response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=94107&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")
response_hash = JSON.parse(response_string)

events = response_hash["events"]
events.each do |event|
    band = event["title"]

    Concert.create(bands: band )
end

binding.pry
