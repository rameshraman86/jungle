class User < ApplicationRecord
  has_secure_password
 
  # validates :name, presence: true
  # validates :username, presence: true, uniqueness: true
  
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  validate :passwords_match

  private

  def passwords_match
    if password != password_confirmation
      errors.add(:password_confirmation, "Passwords must match")
    end
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end

end
