class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def previous
    Video.where(["serial < ?", serial]).last
  end


  def next
    Video.where(["serial > ?", serial]).first
  end
  



  
end
