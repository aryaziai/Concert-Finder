require "pry"
require "rest-client"
require 'json'

require 'rest-client'

puts "Please enter zip code"
user_input = gets.chomp


response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=#{user_input}&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")


# response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=94903&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")

response_hash = JSON.parse(response_string)

puts response_hash

# gives the zipcode as integer 94903
zip_code = JSON.pretty_generate(response_hash["events"][0]["venue"]["postal_code"].to_i)
# gives the city as a string
city = JSON.pretty_generate(response_hash["events"][0]["venue"]["city"])
band = JSON.pretty_generate(response_hash["events"][0]["title"])
# need to fix the date format
announce_date = JSON.pretty_generate(response_hash["events"][0]["announce_date"])
venue_name = JSON.pretty_generate(response_hash["events"][0]["venue"]["name"])
venue_address = JSON.pretty_generate(response_hash["events"][0]["venue"]["address"])
# puts JSON.pretty_generate(response_hash)


# binding.pry

