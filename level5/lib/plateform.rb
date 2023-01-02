class Plateform
  attr_reader :cars, :rentals, :json, :options

  def initialize(cars, rentals, options)
    @json = {rentals: []}
    @cars = cars
    @rentals = rentals
    @options = options
    to_json(rentals)
  end

  def to_json(rentals)
    rentals.each do |rental|
      rental_options = find_options(rental)
      options_for_rental = chosen_options(rental_options)
      action = price_after_options(rental, rental_options)
      json[:rentals] << {id: rental.id, options: options_for_rental, actions: action.actions}
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

  def total_commission(rental)
    commission = rental_price(rental) * 30 / 100
    insurance_fee = commission / 2
    assistance_fee = rental.rental_duration * 100
    drivy_fee = insurance_fee - assistance_fee

    {insurance_fee: insurance_fee, assistance_fee: assistance_fee, drivy_fee: drivy_fee}
  end

  private

  def find_car(rental)
    cars.detect{|car| car.id== rental.car_id}
  end

  def find_options(rental)
    options.select {|option| option.rental_id == rental.id}
  end

  def chosen_options(rental_options)
    options = []
    rental_options.each {|option| options << option.type}
    options
  end

  def price_after_options(rental, rental_options)
    action = Action.new(rental_price: rental_price(rental), commission_fee: total_commission(rental))
    rental_options.each do |option|
      action.driver[:amount] += rental.duration * option.additionnal_option
      if option.type == 'gps' || option.type == 'baby_seat'
        action.owner[:amount] += rental.duration * option.additionnal_option
      else
        action.drivy[:amount] += rental.duration * option.additionnal_option
      end
    end
    action
  end
end