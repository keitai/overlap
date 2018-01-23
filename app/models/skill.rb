class Skill < ApplicationRecord

  validates_uniqueness_of :priority, :allow_blank => true, :allow_nil => true
  belongs_to :section, optional: true
  belongs_to :appointment_skills, optional: true
  
end
