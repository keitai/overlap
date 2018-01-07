class Therapist < ApplicationRecord
  
  has_many :notes
  
  
  def fullname
    "#{first_name} #{last_name}"
  end
  
end
