class Rating < ApplicationRecord
  belongs_to :user, inverse_of: :ratings
  belongs_to :video
  
  validates_presence_of :cue, :level

  enum cue: {approval: 1, dissaproval: 2, other: 3}
  enum level: {mixed: 0, subtle: 1, normal: 2, overt: 3}

end
