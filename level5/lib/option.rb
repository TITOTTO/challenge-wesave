class Option
  VALIDATE_TYPE = %w[gps baby_seat additional_insurance]

  attr_reader :id, :rental_id, :type

  def initialize(id:, rental_id:, type:)
    @id = id
    @rental_id = rental_id
    @type = type
    validate_type
  end

  def additionnal_option
    return 200 if type == 'gps'
    return 500 if type == 'baby_seat'
    return 1000 if type == 'additional_insurance'
  end

  private

  def validate_type
    return if VALIDATE_TYPE.include? type

    raise StandardError.new "Ce n'est pas un type valide"
  end
end