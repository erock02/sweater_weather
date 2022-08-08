require 'rails_helper'

describe "munchie", :vcr do
  it "can send a successful response" do

    get "/api/v1/munchies?location=denver,co&food=chinese"
    expect(response).to be_successful
  end

  it 'sends a muchie data object for the latitude and longitude provided with food choice' do
    get "/api/v1/munchies?location=denver,co&food=chinese"
    munchie  = JSON.parse(response.body, symbolize_names: true)
    expect(munchie).to be_a(Hash)
    expect(munchie).to have_key(:data)
    expect(munchie[:data]).to have_key(:id)
    expect(munchie[:data][:id]).to eq("null")
    expect(munchie[:data]).to have_key(:type)
    expect(munchie[:data][:type]).to eq("forecast")
  end
end
