class Rating < ApplicationRecord
  belongs_to :user, inverse_of: :ratings
  belongs_to :video
  
  validates_presence_of :cue, :level

  enum cue: {approval: 1, disapproval: 2}

  def display
    
  end

end
