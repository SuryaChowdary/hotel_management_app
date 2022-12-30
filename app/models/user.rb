class User < ApplicationRecord
  validates :username, presence: true
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                    
  validates :email , presence: true , 
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 100},
                    format: {with: EMAIL_REGEX}
  has_secure_password
end