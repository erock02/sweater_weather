class MapService < BaseService
  def self.get_location(location)
    response = conn_map.get("geocoding/v1/address?location=#{location}")
    json = get_json(response)
    json[:results]
  end
end
