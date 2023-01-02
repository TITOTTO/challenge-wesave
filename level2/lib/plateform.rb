class Plateform
  attr_reader :cars, :rentals, :json

  def initialize(cars, rentals)
    @json = {rentals: []}
    @cars = cars
    @rentals = rentals
    to_json(rentals)
  end

  def to_json(rentals)
    rentals.each do |rental|
      json[:rentals] << {id: rental.id, price: rental_price(rental)}
    end
    json
  end

  def rental_price(rental)
    car = find_car(rental)
    total_price_per_day = price_after_discount(car.price_per_day, rental.rental_duration)
    total_price_per_km = car.price_per_km * rental.distance

    total_price_per_day + total_price_per_km
  end

  def price_after_discount(price_per_day, nb_days)
    return price_per_day if nb_days == 1
    if nb_days <= 4
      return (price_per_day + ((price_per_day * (nb_days - 1)) * 0.9)).to_i
    elsif nb_days <= 10
      return (price_per_day + ((price_per_day * 3) * 0.9) + ((price_per_day * (nb_days - 4)) * 0.7)).to_i
    elsif nb_days > 10
      return (price_per_day + ((price_per_day * 3) * 0.9)+ ((price_per_day * 6) * 0.7) + ((price_per_day * (nb_days - 10)) * 0.5)).to_i
    end
  end

  private

  def find_car(rental)
    cars.detect{|car| car.id== rental.car_id}
  end
end