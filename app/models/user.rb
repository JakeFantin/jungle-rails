class User < ActiveRecord::Base
  has_secure_password
  
  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
