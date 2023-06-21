require_relative 'nameable'
# base decorator is implemented the store the wrapped method and
# means the initialize or change them
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end
