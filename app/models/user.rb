class User < ApplicationRecord

  EMAIL_FORMAT =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }

  before_save { self.email = email.downcase }

  has_secure_password

  def full_name
    first_name + ' ' + last_name
  end
end