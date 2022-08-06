class Location
  attr_reader :latitude,
              :longitude

  def initialize(map_data)
    @latitude = map_data[:locations][0][:latLng][:lat]
    @longitude = map_data[:locations][0][:latLng][:lng]
  end
end
