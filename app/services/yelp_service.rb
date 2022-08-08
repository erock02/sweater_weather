class YelpService < BaseService
  def self.get_search_results(location)
    response = conn_yelp.get("v3/businesses/search?location=#{location}")
    json = get_json(response)
  end
end
