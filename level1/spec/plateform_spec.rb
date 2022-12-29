require 'car'
require 'driver'
require 'plateform'
require 'rental'
require 'date'
require 'pry'

describe Plateform do
  let(:drivers) { [Driver.new(id: 1)] }
  let(:cars) { [Car.new(id: 1, price_per_day: 200, price_per_km: 10 , owner_id: 1)] }
  let(:rentals) { [Rental.new(id: 1, car_id: 1, start_date: DateTime.new(2022, 12, 20), end_date: DateTime.new(2022, 12, 24), distance: 150)]}
  let(:plateform) { Plateform.new(cars, rentals, drivers)}

  describe "#rental_price" do
    it 'return rental price' do
      expect(plateform.rental_price(rentals[0], drivers[0])).to eq 2500
    end
  end
end
