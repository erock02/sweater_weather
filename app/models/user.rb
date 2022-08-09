class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => { :case_sensitive => true }
  validates_presence_of :password
  validates_confirmation_of :password
  has_secure_password

  def api_key
    SecureRandom.hex
  end
end
