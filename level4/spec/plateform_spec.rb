require 'car'
require 'plateform'
require 'rental'
require 'commission'
require 'action'
require 'date'
require 'pry'

describe Plateform do
  let(:cars) { [Car.new(id: 1, price_per_day: 2000, price_per_km: 10)] }
  let(:rentals) { [Rental.new(id: 1, car_id: 1, start_date: DateTime.new(2022, 12, 20), end_date: DateTime.new(2022, 12, 24), distance: 100)]}
  let(:plateform) { Plateform.new(cars, rentals)}

  describe "#to_json" do
    it 'return an array of Hash' do
      expect(plateform.to_json(rentals)).is_a?(Array)
      expect(plateform.to_json(rentals)).to include(:rentals)
    end
  end

  describe "#rental_price" do
    it 'return rental price' do
      expect(plateform.rental_price(rentals.first)).to eq 9800
    end
  end

  describe "#price_after_discount" do
    it 'return reduct rental price' do
      expect(plateform.price_after_discount(cars.first.price_per_day, rentals.first.duration)).to eq 8800
    end
  end

  describe "#total_commission" do
    it 'return a Hash' do
      expect(plateform.total_commission(rentals.first)).is_a?(Hash)
      expect(plateform.total_commission(rentals.first)).to eq({:assistance_fee=>500, :drivy_fee=>970, :insurance_fee=>1470})
    end
  end
end
