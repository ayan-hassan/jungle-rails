class User < ApplicationRecord
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password) 
    user = User.find_by(email: email.strip.downcase).try(:authenticate, password)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
    
  end
end
