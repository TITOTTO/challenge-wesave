class Rental
  attr_reader :id, :car_id, :start_date, :end_date

  def initialize(id:, car_id:, start_date:, end_date:)
    @id = id
    @car_id = car_id
    @start_date = start_date
    @end_date = end_date
  end

end