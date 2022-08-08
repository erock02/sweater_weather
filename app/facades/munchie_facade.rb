class MunchieFacade
  def self.restaurant(location, type)
    restaurant_data = YelpService.get_search_results(location, type)
    Munchie.new(restaurant_data)
  end
end
