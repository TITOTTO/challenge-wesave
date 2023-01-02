class JsonReader
attr_reader :rentals, :cars

  def initialize(json)
    @rentals = []
    @cars = []
    cars_creation(json["cars"])
    rentals_creation(json["rentals"])
  end

  private

  def rentals_creation(all_rentals)
    all_rentals.each{ |rental| rentals << Rental.new(id: rental["id"], car_id: rental["car_id"], start_date: DateTime.parse(rental["start_date"]), end_date: DateTime.parse(rental["end_date"]), distance: rental["distance"])}
  end

  def cars_creation(all_cars)
    all_cars.each do |car|
      cars << Car.new(id: car["id"], price_per_day: car["price_per_day"], price_per_km: car["price_per_km"])
    end
  end
end