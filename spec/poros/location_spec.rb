require 'rails_helper'

RSpec.describe Location do
  it 'exists with attributes' do
    data = {
    providedLocation: {
    location: "Washington,DC"
    },
      locations: [
      {
        street: "",
        adminArea6: "",
        adminArea6Type: "Neighborhood",
        adminArea5: "Washington",
        adminArea5Type: "City",
        adminArea4: "District of Columbia",
        adminArea4Type: "County",
        adminArea3: "DC",
        adminArea3Type: "State",
        adminArea1: "US",
        adminArea1Type: "Country",
        postalCode: "",
        geocodeQualityCode: "A5XAX",
        geocodeQuality: "CITY",
        dragPoint: false,
        sideOfStreet: "N",
        linkId: "282772166",
        unknownInput: "",
        type: "s",
        latLng: {
          lat: 38.892062,
          lng: -77.019912
        },
        displayLatLng: {
          lat: 38.892062,
          lng: -77.019912
        },
        mapUrl: "http://www.mapquestapi.com/staticmap/v5/map?key=IQIWRdQIQyFtAY1EDP63tjmZ9qemkP6C&type=map&size=225,160&locations=38.892062,-77.019912|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-1074228650"
      }
      ]
    }
    location = Location.new(data)
    expect(location).to be_a(Location)
    expect(location.latitude).to eq(38.892062)
    expect(location.longitude).to eq(-77.019912)
  end
end
