class User < ApplicationRecord
  validates :username, presence: true,length: { minimum: 1 }
  validates :email, uniqueness: true
  has_many :swits, dependent: :destroy
  has_secure_password
end
