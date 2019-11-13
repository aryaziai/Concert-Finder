require "pry"
require "rest-client"
require 'json'

require 'rest-client'
response_string = RestClient.get("https://api.seatgeek.com/2/events?taxonomies.name=concert&postal_code=94903&client_id=MTk0MjAzMjZ8MTU3MzUwOTAyMy40OQ")
response_hash = JSON.parse(response_string)
puts response_hash
