require './corrector'

class person 
  attr_accessor :fulll_name, :age

  def initialize(full_name = 'Unknown', nin)
    @id = Random.rand(1..5000)
    @corrector = Corrector.new 
    @full_name = full_name 
    @nin = nin
  end

  def valdate_name
    @full_name = @corrector.correct_name(full_name)
  end 
end