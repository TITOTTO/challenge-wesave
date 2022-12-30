require_relative 'lib/car'
require_relative 'lib/driver'
require_relative 'lib/plateform'
require_relative 'lib/rental'
require 'json'
require 'pry'

json = File.read('data/input.json')
obj = JSON.parse(json)

cars = obj["cars"]
rentals = obj["rentals"]
binding.pry
p cars
p rentals