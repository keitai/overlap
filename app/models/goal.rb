class Goal < ApplicationRecord
  belongs_to :therapist
  belongs_to :user
  enum status: [:active, :completed, :hold]
  after_initialize :set_default_status, :if => :new_record?
  
  def set_default_status
    self.status ||= :active
  end
  
  
  
end
