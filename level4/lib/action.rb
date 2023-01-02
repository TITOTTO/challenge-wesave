class Action
  attr_reader :actions

  def initialize(rental_price:, commission_fee:)
    driver = {who: 'driver', type: 'debit', amount: rental_price}
    owner = {who: 'owner', type: 'credit', amount: (rental_price * 70 / 100)}
    insurance = {who: 'insurance', type: 'credit', amount: commission_fee[:insurance_fee]}
    assistance = {who: 'assistance', type: 'credit', amount: commission_fee[:assistance_fee]}
    drivy = {who: 'drivy', type: 'credit', amount: commission_fee[:drivy_fee]}
    @actions = [driver, owner, insurance, assistance, drivy]
  end
end