class Section < ApplicationRecord
  has_many :skills
  has_many :appointment_skills
  
  
end
