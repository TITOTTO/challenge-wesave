class Car
  attr_reader :id, :price_per_day, :price_per_km, :owner_id

  def initialize(id:, price_per_day:, price_per_km:, owner_id:)
    @id = id
    @price_per_day = price_per_day
    @price_per_km = price_per_km
    @owner_id = owner_id
  end
end