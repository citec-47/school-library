class Classroom
  attr_accessor :label
  attr_reader :number_of_students

  def initialize(label)
    @label = label
    @number_of_students = []
  end

  def add_student(student)
    @number_of_students << student
    student.classroom = self
  end
end
