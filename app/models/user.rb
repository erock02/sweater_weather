class User < ApplicationRecord
  before_create :assign_api_key

  validates :email, :presence => true, :uniqueness => { :case_sensitive => true }
  validates_presence_of :password
  validates_confirmation_of :password
  has_secure_password
  
  private
    def assign_api_key
      self.api_key = SecureRandom.hex
    end
end
