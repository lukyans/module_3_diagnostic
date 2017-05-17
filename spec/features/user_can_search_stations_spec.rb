require 'rails_helper'

RSpec.feature 'As a user' do
  it "they can fill in the serach form with zipcode" do
    VCR.use_cassette("user_searches_stations") do
      api_key = ENV["api_key"]
        
      stations = Station.find_by(api_key)
      station = stations.first

      visit root_path

      fill_in "Search by zip...", with: "80203"

      click_on "Locate"

      expect(current_path).to be eq("/search")
      expect(stations.count).to eq(10)
      expect(station["name"]).to eq("Denver West Bldg 17")
      expect(station["address"]).to eq("1626 Cole Boulevard")
      expect(station["fuel_type"]).to eq("ELEC")
      expect(station["distance"]).to eq("0.10992")
      expect(station["access_time"]).to eq("MO: 12:00am-12:00am; TU: 12:00am-12:00am; WE: 12:00am-12:00am; TH: 12:00am-12:00am; FR: 12:00am-12:00am; SA: 12:00am-12:00am; SU: 12:00am-12:00am")
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