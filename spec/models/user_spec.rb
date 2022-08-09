require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_uniqueness_of :email}
    it {should have_secure_password}
  end
end
