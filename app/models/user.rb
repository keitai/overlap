class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :notes
  has_many :ratings, inverse_of: :user
  
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_rating?(video)
     Rating.exists?(user: self, video_id: video)    
  end

end
