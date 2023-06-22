require './person'

class Teacher < Person
  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @id = Random.rand(1..100)
  end

  def can_use_services?
    true
  end
end
