class MapService < BaseService
  def self.get_location(location)
    response = conn_map.get("geocoding/v1/address?location=#{location}")
    json = get_json(response)
    json[:results]
  end

  def self.get_route(from, to)
    response = conn_map.get("directions/v2/route?from=#{from}&to=#{to}")
    json = get_json(response)
  end
end
