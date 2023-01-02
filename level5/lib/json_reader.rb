class JsonReader
attr_reader :rentals, :cars, :options

  def initialize(json)
    @rentals = []
    @cars = []
    @options = []
    cars_creation(json["cars"])
    rentals_creation(json["rentals"])
    options_creation(json["options"])
  end

  private

  def rentals_creation(all_rentals)
    all_rentals.each{ |rental| rentals << Rental.new(id: rental["id"], car_id: rental["car_id"], start_date: DateTime.parse(rental["start_date"]), end_date: DateTime.parse(rental["end_date"]), distance: rental["distance"])}
  end

  def cars_creation(all_cars)
    all_cars.each{ |car| cars << Car.new(id: car["id"], price_per_day: car["price_per_day"], price_per_km: car["price_per_km"])}
  end

  def options_creation(all_options)
    all_options.each{ |option| options << Option.new(id: option['id'], rental_id: option['rental_id'], type: option['type'])}
  end
end