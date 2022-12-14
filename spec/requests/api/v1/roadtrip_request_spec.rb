require 'rails_helper'

describe "Roadtrip", :vcr do
  it "can send roadtrip information" do
    user1 = User.create!(email: 'AH@awesomeactors.com', password: '123abc', password_confirmation: '123abc')
    user1.update_attribute(:api_key, 'test')
    trip_params = ({
                origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: 'test'
              })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/roadtrip", headers: headers, params: JSON.generate(trip_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to eq("roadtrip")
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to eq("null")
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it "sad path: wrong api key returns 401 status" do
    user1 = User.create!(email: 'AH@awesomeactors.com', password: '123abc', password_confirmation: '123abc')
    user1.update_attribute(:api_key, 'test')
    trip_params = ({
                origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: "wrongapikey"
              })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/roadtrip", headers: headers, params: JSON.generate(trip_params)

      expect(response.status).to eq(401)
  end

  it "sad path: impossible route returns custom message" do
    user1 = User.create!(email: 'AH@awesomeactors.com', password: '123abc', password_confirmation: '123abc')
    user1.update_attribute(:api_key, 'test')
    trip_params = ({
                origin: "Denver,CO",
                destination: "London,UK",
                api_key: 'test'
              })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/roadtrip", headers: headers, params: JSON.generate(trip_params)
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to eq("roadtrip")
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to eq("null")
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to eq("impossible")
      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to eq("")
  end
end
