class Plateform
  attr_reader :cars, :rentals, :drivers

  def initialize(cars, rentals, drivers)
    @cars = cars
    @rentals = rentals
    @drivers = drivers
  end

  def add_driver(rental, start_date, end_date, distance)
    raise StandardError.new "La voiture n'est pas disponible à ces date" unless available?(rental, start_date, end_date)

    drivers << Driver.new(id: (drivers.last.id + 1), rental_id: rental.id, start_date: start_date, end_date: end_date, distance: distance)
  end

  def rental_price(rental, driver)
    car = find_car(rental)
    total_price_per_day = car.price_per_day * driver.duration
    total_price_per_km = car.price_per_km * driver.distance

    total_price_per_day + total_price_per_km
  end

  def available?(rental, rent_date, return_date)
    return true if rental.start_date <= rent_date && rental.end_date >= rent_date && rental.start_date <= return_date && rental.end_date >= return_date

    raise StandardError.new "La voiture n'est pas disponible à ces date"
  end

  private

  def find_car(rental)
    cars.detect{|car| car.id == rental.car_id}
  end

end