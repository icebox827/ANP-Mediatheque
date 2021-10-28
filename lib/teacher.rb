require './person'

class Teacher < Person
  def initialize(nin, course, full_name='Unknown', authorized: true)
    super(nin, full_name, authorized)
    @course = course
  end

  def can_use_service 
    true
  end
end