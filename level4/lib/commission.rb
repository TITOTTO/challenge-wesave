class Commission
  attr_reader :price, :insurance_fee, :drivy_fee, :assistance_fee, :rental_id

  def initialize(price:, day:, rental_id:)
    @rental_id = rental_id
    @insurance_fee = price * 30 / 100
    @assistance_fee = day * 100
    @drivy_fee = @insurance_fee - @assistance_fee
  end
end