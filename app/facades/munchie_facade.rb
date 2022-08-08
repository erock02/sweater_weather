class MunchieFacade
  def self.restaurant(location)
    restaurant_data = YelpService.get_search_results(location)
    Munchie.new(restaurant_data)
  end
end
