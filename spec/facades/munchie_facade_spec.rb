require 'rails_helper'

RSpec.describe MunchieFacade, :vcr do
  describe 'Facade methods' do
    it '.restaurant returns a Munchie poro of the location provided' do
      munchie = MunchieFacade.restaurant("denver,co", "chinese")
      expect(munchie).to be_a(Munchie)
    end
  end
end
