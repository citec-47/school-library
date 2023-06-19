class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # getter and setter in one
  attr_accessor :name
  attr_accessor :age

  # getter
  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :is_of_age?

  def can_use_services?
    @parent_permission || is_of_age?
  end
end

person1 = Person.new(23, 'peter')
person1.parent_permission
