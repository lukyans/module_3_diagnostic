class StationService
  def self.find_station(api_key)
   
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{api_key}&format=JSON?zip=80203&location=Denver,CO&fuel_type=ELEC&LPG&limit=10&radius=6")

    parsed = JSON.parse(response.body)
    
  end  
end