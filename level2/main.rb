require_relative 'lib/car'
require_relative 'lib/plateform'
require_relative 'lib/rental'
require_relative 'lib/json_reader'
require 'json'
require 'pry'
require 'date'
require 'pp'

json = File.read('data/input.json')
obj = JSON.parse(json)
j = JsonReader.new(obj)
plateform = Plateform.new(j.cars, j.rentals)
File.open("output.json","w") do |f|
  f.write(JSON.pretty_generate(plateform.json))
end