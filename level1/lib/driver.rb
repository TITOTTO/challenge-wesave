class Driver
  attr_reader :id, :rental_id, :start_date, :end_date, :distance, :rental_duration

  def initialize(id:, rental_id:, start_date:, end_date:, distance:)
    @id = id
    @rental_id = rental_id
    @start_date = start_date
    @end_date = end_date
    @distance = distance
    @rental_duration = duration
  end

  def duration
    (end_date - start_date).to_i + 1
  end
end