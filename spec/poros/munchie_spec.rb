require 'rails_helper'

RSpec.describe Munchie do
  it 'exists with attributes' do
    data = {
    "businesses": [
        {
            "id": "Yb4iTpZ3SjSEenqY6XMbFA",
            "alias": "taste-of-china-denver",
            "name": "Taste of China",
            "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/jeBKUZqU9TxsDp4Y5HnHFg/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/taste-of-china-denver?adjust_creative=XL83MthYT4rBoMkZ7N3Xbg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=XL83MthYT4rBoMkZ7N3Xbg",
            "review_count": 150,
            "categories": [
                {
                    "alias": "chinese",
                    "title": "Chinese"
                },
                {
                    "alias": "thai",
                    "title": "Thai"
                },
                {
                    "alias": "asianfusion",
                    "title": "Asian Fusion"
                }
            ],
            "rating": 4.5,
            "coordinates": {
                "latitude": 39.74702,
                "longitude": -105.02571
            },
            "transactions": [
                "pickup",
                "delivery"
            ],
            "price": "$$",
            "location": {
                "address1": "1935 Federal Blvd",
                "address2": "",
                "address3": nil,
                "city": "Denver",
                "zip_code": "80204",
                "country": "US",
                "state": "CO",
                "display_address": [
                    "1935 Federal Blvd",
                    "Denver, CO 80204"
                ]
            },
            "phone": "+13034772204",
            "display_phone": "(303) 477-2204",
            "distance": 4901.717617542795
        }
    ],
    "total": 528,
    "region": {
        "center": {
            "longitude": -104.97024536132812,
            "latitude": 39.73552421220229
        }
    }
}
    munchie = Munchie.new(data)
    expect(munchie).to be_a(Munchie)
    expect(munchie.destination_city).to eq("Denver, CO")
    expect(munchie.restaurant).to eq({:name=>"Taste of China", :address=>"1935 Federal Blvd"})
  end
end
