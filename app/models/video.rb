class Video < ApplicationRecord
  validates_uniqueness_of :youtube_id, :serial  
  has_many :ratings, :dependent => :delete_all
  
  


  
end
