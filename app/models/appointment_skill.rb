class AppointmentSkill < ApplicationRecord
  enum rating: [:NA, :No, :Yes]
  after_initialize :set_default_rating, :if => :new_record?

  belongs_to :skill
  belongs_to :appointment
  belongs_to :section

  
  def set_default_rating
    self.rating ||= :NA
  end
  

end
