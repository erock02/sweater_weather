class YelpService < BaseService
  def self.get_search_results(location, type)
    response = conn_yelp.get("v3/businesses/search?term=#{type}&term=restaurants&limit=1&location=#{location}")
    json = get_json(response)
  end
end
