class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  # add student manage the relationship between the classroom and student
  def add_student(student)
    @student.push(student)
    student.manage_classroom = self
  end
end
