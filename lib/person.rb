require './corrector'

class person 
  attr_accessor :fulll_name, :age

  def initialize(full_name = 'Unknown', nin, authorized: true)
    @id = Random.rand(1..5000)
    @corrector = Corrector.new 
    @full_name = full_name 
    @nin = nin
  end

  def can_use_service? 
    authorized
  end

  def valdate_name
    @full_name = @corrector.correct_name(full_name)
  end 
end