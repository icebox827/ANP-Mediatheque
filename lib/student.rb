require './person'
require './classroom'

class Student < person
  attr_reader :classroom 

  def initialize(nin, classroom, full_name = 'Unknow', authorized: true)
    suoer(nin, full_name, authorized)
    @nin = nin 
    @full_name = full_name
    @classroom = classroom 
    classroom.students << self
  end

  def classroom=(classroom) 
    @classroom = classroom 
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end