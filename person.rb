require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rentals'

# Person class provide the defuslt implementation of the correct_name method
class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  # getter and setter in one
  attr_accessor :name, :age, :rentals

  # getter
  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
