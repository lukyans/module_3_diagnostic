require 'rails_helper'

RSpec.feature 'As a user' do
  it "they can fill in the serach form with zipcode" do
  user = User.create(name: "Jack")
  stations = Station.create(name: "PennStation", address: "Denver", fuel_type: "E85", distance: 6, access_time: "24 hours daily")

  visit root_path

  fill_in "station[zipcode]", with: "80203"

  click_on "Locate"
  expect(current_path).to be eq("/search")
  expect(stations.count).to eq(10)

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