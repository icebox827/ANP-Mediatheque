class Corrector
  def correct_name(fullName) 
    fullName.capitalize!
    fullName[0, 30]
  end
end