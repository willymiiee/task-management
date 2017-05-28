class User < ActiveRecord::Base
  has_many :tasks
  before_save { self.username = username.downcase }
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
