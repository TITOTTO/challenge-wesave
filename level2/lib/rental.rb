class Rental
  attr_reader :id, :car_id, :start_date, :end_date, :distance, :rental_duration

  def initialize(id:, car_id:, start_date:, end_date:, distance:)
    @id = id
    @car_id = car_id
    @start_date = start_date
    @end_date = end_date
    @distance = distance
    @rental_duration = duration
  end

  def duration
    (end_date - start_date).to_i + 1
  end

end