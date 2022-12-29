require 'car'
require 'driver'
require 'plateform'
require 'rental'
require 'date'
require 'pry'

describe Plateform do
  let(:drivers) { [Driver.new(id: 1, rental_id: 1, start_date: DateTime.new(2022, 12, 20), end_date: DateTime.new(2022, 12, 22), distance: 150)] }
  let(:cars) { [Car.new(id: 1, price_per_day: 200, price_per_km: 10 , owner_id: 1)] }
  let(:rentals) { [Rental.new(id: 1, car_id: 1, start_date: DateTime.new(2022, 12, 20), end_date: DateTime.new(2022, 12, 24))]}
  let(:plateform) { Plateform.new(cars, rentals, drivers)}

  describe "#rental_price" do
    it 'return rental price' do
      expect(plateform.rental_price(rentals.first, drivers.first)).to eq 2100
    end
  end
  describe "#add_driver" do
    it 'Create a new driver without error' do
      expect(plateform.drivers.count).to eq 1
      plateform.add_driver(rentals[0], DateTime.new(2022, 12, 20), DateTime.new(2022, 12, 22), 100)
      expect(plateform.drivers.count).to eq 2
      expect(plateform.drivers.last.rental_id).to eq 1
    end
  end
end
