class StationService
  def self.find_station(api_key)
   
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{api_key}&format=JSON?zip=80203&limit=10&location=1617+Cole+Blvd+Golden+CO&fuel_type=ELEC&LPG")

    JSON.parse(response.body)
  end  
end