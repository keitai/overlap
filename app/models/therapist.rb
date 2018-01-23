class Therapist < ApplicationRecord
  
  has_many :notes
  has_many :appointments
  has_many :goals
  
  
  
  def fullname
    "#{first_name} #{last_name}"
  end
  
#  def overlap_average
#    appointments = Appointment.where(therapist_id: self)
#    average = appointments.sum(&:score)/appointments.count.to_f
#  end
  
  
end
