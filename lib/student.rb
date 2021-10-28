require './person'

class Student < person
  attr_reader :classroom 

  def initialize(age, classroom, full_name = 'Unknow',)
    suoer(age, full_name)
    @classroom = classroom 
    classroom.students << self
  end

  def classroom=(classroom) 
    @classroom = classroom 
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end