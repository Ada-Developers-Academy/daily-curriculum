class Ghost
  
  def people_scared
    total_days = 0
    days_of_scaring.each do |scares|
      total_days += scares
    end
  end
  
  def days_of_scaring
    [34,55,1,11]
  end
end