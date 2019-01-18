class User < ApplicationRecord
  enum role: [:user, :admin, :team]
  after_initialize :set_default_role, :if => :new_record?
  has_many :notes
  has_many :ratings, inverse_of: :user, :dependent => :delete_all
  
  validates_format_of :email, :with => /@(centerforautism.com|cardclinics.com)/, :message => "- Registration is for CARD Employees only."
  
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
