class Corrector
  def correct_name(full_name) 
    full_name.capitalize!
    full_name[0, 30]
  end
end