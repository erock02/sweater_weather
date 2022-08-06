class MapFacade
  def self.location(location)
    map_data = MapService.get_location(location)
    Location.new(map_data[0])
  end
end
