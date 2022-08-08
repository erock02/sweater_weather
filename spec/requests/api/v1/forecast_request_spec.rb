require 'rails_helper'

describe "Forecast", :vcr do
  it "can send a successful response" do

    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful
  end

  it "sends a forecast for the latitude and longitude provided" do
    get "/api/v1/forecast?location=denver,co"
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq("null")
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq("forecast")
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:description)

    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:daily_weather].length).to eq(5)
    forecast[:data][:attributes][:daily_weather].each do |dweather|
      expect(dweather).to have_key(:date)
      expect(dweather).to have_key(:sunrise)
      expect(dweather).to have_key(:sunset)
      expect(dweather).to have_key(:max_temp)
      expect(dweather).to have_key(:min_temp)
      expect(dweather).to have_key(:conditions)
      expect(dweather).to have_key(:icon)
    end

  end
end
