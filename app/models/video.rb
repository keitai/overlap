class Video < ApplicationRecord
  validates_uniqueness_of :youtube_id, :serial  
  has_many :ratings, :dependent => :delete_all
  
  

  def previous
    Video.where(["serial < ?", serial]).last
  end


  def next
    Video.where(["serial > ?", serial]).first
  end
  
end
