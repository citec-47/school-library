require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission)
    @id = Random.rand(1..1000)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.number_of_students.push(self) unless classroom.number_of_students.include?(self)
  end
end