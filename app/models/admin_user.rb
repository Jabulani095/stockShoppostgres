class AdminUser < ActiveRecord::Base
  
  has_secure_password
  has_and_belongs_to_many :events_Id
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :First_name, :presence => true, :length => {:maximum => 25}
  validates :email, :presence => true, :length => {:maximum => 50}, :format => EMAIL_REGEX, :confirmation =>true
                       
end
