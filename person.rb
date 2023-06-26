require './nameable'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end