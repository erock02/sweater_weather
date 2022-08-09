class MapFacade
  def self.location(location)
    map_data = MapService.get_location(location)
    Location.new(map_data[0])
  end

  def self.route(from, to)
    route_data = MapService.get_route(from, to)
    Route.new(route_data, from, to)
  end
end
