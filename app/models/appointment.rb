class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist
  
  
  def score
    return [self.behavior_management_score, self.natural_environment_score, self.behavior_management_score, self.structured_lesson_score, self.language_promotion_score].sum
  end
  
end
