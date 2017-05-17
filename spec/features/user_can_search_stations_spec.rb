require 'rails_helper'

RSpec.feature 'As a user' do
  it "they can fill in the serach form with zipcode" do
    VCR.use_cassette("user_searches_stations") do
      api_key = ENV["api_key"]
        
      stations = Station.find_by(api_key)
      station = stations.first

      visit root_path

      # fill_in "zipcode", with: "80203"

      click_on "Locate"

      # expect(current_path).to be eq("/search")
      expect(stations.count).to eq(10)
      expect(sations).to be_a(Hash)
      expect(station).to have_key("name")
      expect(station).to have_key("address")
      expect(station).to have_key("fuel_type")
      expect(station).to have_key("distance")
      expect(station).to have_key("access_time")

      expect(station["name"]).to be_a(String)
      expect(station["address"]).to be_a(String)
      expect(station["fuel_type"]).to be_a(String)
      expect(station["distance"]).to be_a(Decimal)
      expect(station["access_time"]).to be_a(String)
    end
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times