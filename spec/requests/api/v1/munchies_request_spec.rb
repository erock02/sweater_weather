require 'rails_helper'

describe "munchie", :vcr do
  it "can send a successful response" do

    get "/api/v1/munchies?location=denver,co&food=chinese"
    expect(response).to be_successful
  end

  it 'sends a muchie data object for the latitude and longitude and food choice provided in params' do
    get "/api/v1/munchies?location=denver,co&food=chinese"
    munchie  = JSON.parse(response.body, symbolize_names: true)
    expect(munchie).to be_a(Hash)
    expect(munchie).to have_key(:data)
    expect(munchie[:data]).to have_key(:id)
    expect(munchie[:data][:id]).to eq("null")
    expect(munchie[:data]).to have_key(:type)
    expect(munchie[:data][:type]).to eq("munchie")
    expect(munchie[:data]).to have_key(:attributes)
    expect(munchie[:data][:attributes]).to have_key(:destination_city)
    expect(munchie[:data][:attributes][:destination_city]).to be_a(String)
    expect(munchie[:data][:attributes]).to have_key(:forecast)
    expect(munchie[:data][:attributes][:forecast]).to be_a(Hash)
    expect(munchie[:data][:attributes][:forecast]).to have_key(:summary)
    expect(munchie[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(munchie[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(munchie[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(munchie[:data][:attributes]).to have_key(:restaurant)
    expect(munchie[:data][:attributes][:restaurant]).to have_key(:name)
    expect(munchie[:data][:attributes][:restaurant][:name]).to be_a(String)
    expect(munchie[:data][:attributes][:restaurant]).to have_key(:address)
    expect(munchie[:data][:attributes][:restaurant][:address]).to be_a(String)

  end

  describe 'sad path testing' do
    it 'sends a 400 status if location is missing' do
      get "/api/v1/munchies?food=chinese"
      expect(response.status).to eq(400)
    end

    it 'sends a 400 status if food is missing' do
      get "/api/v1/munchies?location=denver,co"
      expect(response.status).to eq(400)
    end

    it 'sends a 400 status if location is blank' do
      get "/api/v1/munchies?location=&food=chinese"
      expect(response.status).to eq(400)
    end

    it 'sends a 400 status if food is blank' do
      get "/api/v1/munchies?location=denver,co&food="
      expect(response.status).to eq(400)
    end
  end
end
