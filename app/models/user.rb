class User < ApplicationRecord
  has_secure_password
 
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }  # Minimum password length of 8 characters

end
