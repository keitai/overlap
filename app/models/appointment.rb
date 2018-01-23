class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist
  belongs_to :client

  has_many :skills, through: :appointment_skills 
  has_many :appointment_skills
  
  accepts_nested_attributes_for :appointment_skills
  
  validates_presence_of :client, :therapist
  
  after_create :assign_skills

    
  def score
    a = AppointmentSkill.where(appointment_id: self)      

  end
  
  def overlap_number(therapist, appointment)
    overlaps = Appointment.where(therapist_id: therapist)
    overlaps.index(appointment) + 1
  end
  
  def previous
    therapist.appointments.where("id < ?", id).last
  end
  
  def assign_skills
    skills = Skill.all
    skills.each do |skill|
      AppointmentSkill.create(:appointment_id => self.id, :skill_id => skill.id, :position => skill.priority, :section_id => skill.section_id, :section_title => skill.section_title)
    end
  end
  
  
  
  

  
  
end
