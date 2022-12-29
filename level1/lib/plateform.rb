class Plateform
  attr_reader :cars, :rentals, :drivers

  def initialize(cars, rentals, drivers)
    @cars = cars
    @rentals = rentals
    @drivers = drivers
  end

  def rental_price(rental, driver)
    car = find_car(rental)
    total_price_per_day = car.price_per_day * rental.duration
    total_price_per_km = car.price_per_km * rental.distance

    total_price_per_day + total_price_per_km
  end

  private

  def find_car(rental)
    cars.detect{|car| car.id == rental.car_id}
  end

end