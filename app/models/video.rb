class Video < ApplicationRecord
  validates_uniqueness_of :youtube_id, :serial  
  has_many :ratings, :dependent => :delete_all
  
  

  def to_param
     "#{id}-#{serial}-cue"
   end
  
end
