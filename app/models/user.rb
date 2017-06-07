class User < ApplicationRecord
  validates :username, presence: true,length: { minimum: 1 }
  validates :email, uniqueness: true
  has_secure_password
end
