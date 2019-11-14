require "pry"
require "rest-client"
require 'json'

puts "type a something"
user_input = gets.chomp

response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=#{user_input}&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")
response_hash = JSON.parse(response_string)

# gives the zipcode as integer 94903
# zip_code = JSON.pretty_generate(response_hash["events"][0]["venue"]["postal_code"].to_i)

# gives the city as a string
# city = JSON.pretty_generate(response_hash["events"][0]["venue"]["city"])
def city(hash)
  count = 0
  city_arr = []
  while count < response_hash["events"].length
    city = JSON.pretty_generate(response_hash["events"][0]["venue"]["city"])
    city_arr << city
    count += 1
  end
end

def band(response_hash)
  count = 0
  band_arr = []
  while count < response_hash["events"].length
    band = JSON.pretty_generate(response_hash["events"][count]["title"])
    band_arr << band
    puts band
    count += 1
  end
end
# puts band(response_hash)

def announce_date(response_hash)
  count = 0
  announce_date_arr = []
  while count < response_hash["events"].length
    announce_date = JSON.pretty_generate(response_hash["events"][0]["announce_date"])
    announce_date_arr << announce_date
    puts band
    count += 1
  end
end
puts announce_date(response_hash)
# band = JSON.pretty_generate(response_hash["events"][0]["title"])
# need to fix the date format
announce_date = JSON.pretty_generate(response_hash["events"][0]["announce_date"])
venue_name = JSON.pretty_generate(response_hash["events"][0]["venue"]["name"])
venue_address = JSON.pretty_generate(response_hash["events"][0]["venue"]["address"])
# puts JSON.pretty_generate(response_hash)
