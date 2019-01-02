class Video < ApplicationRecord
  validates_uniqueness_of :youtube_id, :serial  
  has_many :ratings
  
  

  def previous
    Video.where(["serial < ?", serial]).last
  end


  def next
    Video.where(["serial > ?", serial]).first
  end
  
end
